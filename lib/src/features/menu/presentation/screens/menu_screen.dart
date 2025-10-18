import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CanteenGo — Menu')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _MenuCard(title: 'Nasi Goreng', price: 20000),
          const _MenuCard(title: 'Mie Ayam', price: 18000),
          const _MenuCard(title: 'Es Teh Manis', price: 6000),
          const SizedBox(height: 24),
          Row(
            children: [
              FilledButton(
                onPressed: () => context.goNamed('cart'),
                child: const Text('Ke Keranjang'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () => context.goNamed('orders'),
                child: const Text('Lihat Pesanan'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.title, required this.price});
  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text('Rp $price'),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart_outlined),
          onPressed: () {}, // akan dihubungkan di Bagian 3 (Riverpod)
        ),
      ),
    );
  }
}
