import 'package:canteen_go/src/app/layout/breakpoints.dart';
import 'package:canteen_go/src/app/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex; // 0: Menu, 1: Orders, 2: Cart

  void _onTap(BuildContext context, int idx) {
    switch (idx) {
      case 0:
        context.goNamed('menu');
      case 1:
        context.goNamed('orders');
      case 2:
        context.goNamed('cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // PHONE → BottomNavigationBar
    if (width < Breakpoints.tablet) {
      return Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (i) => _onTap(context, i),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.restaurant_menu),
              label: 'Menu',
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long),
              label: 'Pesanan',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Keranjang',
            ),
          ],
        ),
      );
    }

    // TABLET/WEB → NavigationRail
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: (i) => _onTap(context, i),
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.restaurant_menu),
                label: Text('Menu'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.receipt_long),
                label: Text('Pesanan'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart),
                label: Text('Keranjang'),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Tokens.l),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
