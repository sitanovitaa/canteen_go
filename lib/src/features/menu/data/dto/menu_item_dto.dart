import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';

class MenuItemDto {
  const MenuItemDto({
    required this.id,
    required this.name,
    required this.price,
    required this.available,
    required this.category,
    this.imageUrl,
  });

  final String id;
  final String name;
  final int price;
  final bool available;
  final String category;
  final String? imageUrl;

  factory MenuItemDto.fromSupabase(Map<String, dynamic> json) {
    return MenuItemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      available: json['available'] as bool,
      imageUrl: json['image_url'] as String?,
      category: json['category'] as String,
    );
  }

  MenuItem toDomain() => MenuItem(
        id: id,
        name: name,
        price: price,
        available: available,
        imageUrl: imageUrl,
        category: category,
      );
}
