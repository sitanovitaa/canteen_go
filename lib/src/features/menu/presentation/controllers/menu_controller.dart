// lib/src/features/menu/presentation/controllers/menu_controller.dart
import 'package:canteen_go/src/core/network/supabase_client.dart';
import 'package:canteen_go/src/core/storage/local_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repo/menu_repo.dart';
import '../../domain/models/menu_item.dart';
import '../../domain/usecases/refresh_menu.dart';

final menuRepoProvider = Provider<MenuRepo>((ref) {
  final client = SupabaseAppClient.instance;
  final localStore = ref.watch(localStoreProvider);

  return SupabaseMenuRepo(client, localStore: localStore);
});

final refreshMenuProvider = Provider<RefreshMenu>((ref) {
  final repo = ref.watch(menuRepoProvider);
  return RefreshMenu(repo);
});

final menuControllerProvider =
    StateNotifierProvider<MenuController, AsyncValue<List<MenuItem>>>((ref) {
      return MenuController(ref);
    });

class MenuController extends StateNotifier<AsyncValue<List<MenuItem>>> {
  MenuController(this._ref)
    : super(const AsyncValue<List<MenuItem>>.loading()) {
    load();
  }

  final Ref _ref;

  Future<void> load({bool refresh = false}) async {
    state = const AsyncValue<List<MenuItem>>.loading();

    final refreshMenu = _ref.read(refreshMenuProvider);
    state = await AsyncValue.guard(() => refreshMenu(refresh: refresh));
  }

  Future<void> refresh() => load(refresh: true);
}
