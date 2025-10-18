import 'package:canteen_go/src/app/layout/responsive_scaffold.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveScaffold(
      currentIndex: 2,
      child: Center(child: Text('Keranjang kosong (UI-first).')),
    );
  }
}
