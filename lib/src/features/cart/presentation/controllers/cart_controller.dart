import 'package:canteen_go/src/features/cart/domain/models/cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController extends StateNotifier<List<CartItem>> {
  CartController() : super(const []);

  void add(CartItem item) {
    // Optimistic: langsung update UI
    final i = state.indexWhere((e) => e.menuId == item.menuId);
    if (i == -1) {
      state = [...state, item];
    } else {
      final curr = state[i];
      state = [
        for (var j = 0; j < state.length; j++)
          if (j == i) curr.copyWith(qty: curr.qty + item.qty) else state[j],
      ];
    }
  }

  void remove(String menuId) {
    state = state.where((item) => item.menuId != menuId).toList();
  }

  void setQty(String menuId, int qty) {
    state = state
        .map((item) => item.menuId == menuId ? item.copyWith(qty: qty) : item)
        .toList();
  }
}

final cartProvider = StateNotifierProvider<CartController, List<CartItem>>(
  (ref) => CartController(),
);
