import 'package:canteen_go/src/core/storage/local_store.dart';
import 'package:canteen_go/src/features/menu/data/dto/menu_item_dto.dart';
import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MenuRepo {
  Future<List<MenuItem>> fetchMenu({bool refresh = false});
}

class SupabaseMenuRepo implements MenuRepo {
  SupabaseMenuRepo(
    this._client, {
    LocalStore? localStore,
  }) : _localStore = localStore;
  final SupabaseClient _client;
  final LocalStore? _localStore;

  @override
  Future<List<MenuItem>> fetchMenu({bool refresh = false}) async {
    if (!refresh && _localStore != null) {
      final cached = await _localStore!.getMenuItems();
      if (cached.isNotEmpty) return cached;
    }

    final response = await _client
        .from('menu_items')
        .select('id, name, price, available, image_url, category')
        .order('name');

    final items = (response as List<dynamic>)
        .map(
          (row) => MenuItemDto.fromSupabase(
            Map<String, dynamic>.from(row as Map<dynamic, dynamic>),
          ),
        )
        .map((dto) => dto.toDomain())
        .toList();

    await _localStore?.saveMenuItems(items);

    return items;
  }
}
