import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required String menuId,
    required String name,
    required int price,
    @Default(1) int qty,
  }) = _CartItem;
}
