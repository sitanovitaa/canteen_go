import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/menu/presentation/screens/menu_screen.dart';
import '../features/orders/presentation/screens/orders_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'menu',
      builder: (context, state) => const MenuScreen(),
      routes: [
        GoRoute(
          path: 'orders',
          name: 'orders',
          builder: (context, state) => const OrdersScreen(),
        ),
        GoRoute(
          path: 'cart',
          name: 'cart',
          builder: (context, state) => const CartScreen(),
        ),
      ],
    ),
  ],
);
