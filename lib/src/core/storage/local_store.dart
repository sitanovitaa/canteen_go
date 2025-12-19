import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:canteen_go/src/core/storage/isar_db.dart';
import 'package:canteen_go/src/features/menu/data/local/menu_item_isar.dart';
import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';
import 'package:isar/isar.dart';

class LocalStore {
  Future<List<MenuItem>> getMenuItems() async {
    final isar = await IsarDB.instance();
    final items = await isar.menuItemIsars.where().findAll();

    return items.map((item) => item.toDomain()).toList();
  }

  Future<void> saveMenuItems(List<MenuItem> items) async {
    final isar = await IsarDB.instance();
    final records = items.map(MenuItemIsar.fromDomain).toList();

    await isar.writeTxn(() async {
      await isar.menuItemIsars.clear();
      await isar.menuItemIsars.putAll(records);
    });
  }
}

final localStoreProvider = Provider<LocalStore>((_) => LocalStore());
