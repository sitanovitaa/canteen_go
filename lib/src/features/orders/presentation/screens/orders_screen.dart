import 'package:canteen_go/src/features/orders/presentation/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersStreamProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pesanan')),
      body: Center(
        child: orders.when(
          data: (orders) => ListView(
            padding: const EdgeInsets.all(16),
            children: orders.map((order) => Text(order)).toList(),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) =>
              Center(child: Text('Gagal memuat pesanan: $error')),
        ),
      ),
    );
  }
}
