import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';
import 'package:isar/isar.dart';

part 'menu_item_isar.g.dart';

@collection
class MenuItemIsar {
  Id idIsar = Isar.autoIncrement; // internal id (opsional)

  @Index(unique: true, replace: true)
  late String id; // id domain (uuid/string)

  late String name;
  late int price;
  late bool available;
  String? imageUrl;
  String category = 'food';

  // helper mapping
  static MenuItemIsar fromDomain(MenuItem m) => MenuItemIsar()
    ..id = m.id
    ..name = m.name
    ..price = m.price
    ..available = m.available
    ..imageUrl = m.imageUrl
    ..category = m.category;

  MenuItem toDomain() => MenuItem(
        id: id,
        name: name,
        price: price,
        available: available,
        imageUrl: imageUrl,
        category: category,
      );
}
