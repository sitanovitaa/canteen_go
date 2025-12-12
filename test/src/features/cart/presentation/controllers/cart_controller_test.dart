import 'package:canteen_go/src/features/cart/domain/models/cart_item.dart';
import 'package:canteen_go/src/features/cart/presentation/controllers/cart_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartController', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is empty', () {
      final state = container.read(cartProvider);
      expect(state, isEmpty);
    });

    test('add item updates state', () {
      final item = CartItem(
        menuId: 'm1',
        name: 'Test Item',
        price: 1000,
        qty: 1,
      );

      container.read(cartProvider.notifier).add(item);

      final state = container.read(cartProvider);
      expect(state, hasLength(1));
      expect(state.first, item);
    });

    test('add existing item increases quantity', () {
      final item = CartItem(
        menuId: 'm1',
        name: 'Test Item',
        price: 1000,
        qty: 1,
      );

      final controller = container.read(cartProvider.notifier);
      controller.add(item);
      controller.add(item);

      final state = container.read(cartProvider);
      expect(state, hasLength(1));
      expect(state.first.qty, 2);
    });

    test('remove item updates state', () {
      final item = CartItem(
        menuId: 'm1',
        name: 'Test Item',
        price: 1000,
        qty: 1,
      );

      final controller = container.read(cartProvider.notifier);
      controller.add(item);
      controller.remove('m1');

      final state = container.read(cartProvider);
      expect(state, isEmpty);
    });

    test('setQty updates quantity', () {
      final item = CartItem(
        menuId: 'm1',
        name: 'Test Item',
        price: 1000,
        qty: 1,
      );

      final controller = container.read(cartProvider.notifier);
      controller.add(item);
      controller.setQty('m1', 5);

      final state = container.read(cartProvider);
      expect(state.first.qty, 5);
    });
  });
}
