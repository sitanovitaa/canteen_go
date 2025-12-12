import 'package:canteen_go/src/app/layout/responsive_scaffold.dart';
import 'package:canteen_go/src/features/cart/presentation/screens/cart_screen.dart';
import 'package:canteen_go/src/features/menu/presentation/screens/menu_screen.dart';
import 'package:canteen_go/src/features/orders/presentation/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).uri.toString();
  if (location.startsWith('/orders')) {
    return 1;
  }
  if (location.startsWith('/cart')) {
    return 2;
  }
  return 0;
}

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ResponsiveScaffold(
          currentIndex: _calculateSelectedIndex(context),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'menu',
          builder: (context, state) => const MenuScreen(),
        ),
        GoRoute(
          path: '/orders',
          name: 'orders',
          builder: (context, state) => const OrdersScreen(),
        ),
        GoRoute(
          path: '/cart',
          name: 'cart',
          builder: (context, state) => const CartScreen(),
        ),
      ],
    ),
  ],
);
