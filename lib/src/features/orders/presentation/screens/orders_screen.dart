import 'package:canteen_go/src/app/layout/responsive_scaffold.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveScaffold(
      currentIndex: 1,
      child: Center(child: Text('Belum ada pesanan.')),
    );
  }
}
