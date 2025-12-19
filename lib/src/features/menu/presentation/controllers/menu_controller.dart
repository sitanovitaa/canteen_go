import 'package:canteen_go/src/features/menu/data/repo/menu_repo.dart';
import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuRepoProvider = Provider<MenuRepo>((ref) => FakeMenuRepo());

class MenuController extends StateNotifier<AsyncValue<List<MenuItem>>> {
  MenuController(this.ref) : super(const AsyncValue.loading()) {
    _loadMenu();
  }

  final Ref ref;

  Future<void> _loadMenu() async {
    try {
      final repo = ref.read(menuRepoProvider);
      final items = await repo.fetchMenu();
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final menuControllerProvider =
    StateNotifierProvider<MenuController, AsyncValue<List<MenuItem>>>(
      (ref) => MenuController(ref),
    );
