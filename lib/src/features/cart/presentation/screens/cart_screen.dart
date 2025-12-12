import 'package:canteen_go/src/app/theme/tokens.dart';
import 'package:canteen_go/src/features/cart/presentation/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(cartProvider);
    final total = items.fold(0, (sum, item) => sum + item.price * item.qty);

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: items.isEmpty
          ? const Center(child: Text('Keranjang Anda kosong.'))
          : ListView.separated(
              itemCount: items.length,
              itemBuilder: (context, i) {
                final item = items[i];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Rp ${item.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(cartProvider.notifier).remove(item.menuId);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(item.qty.toString()),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(cartProvider.notifier)
                              .setQty(item.menuId, item.qty + 1);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, i) => const Divider(),
            ),
      bottomNavigationBar: items.isEmpty
          ? null
          : BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(Tokens.l),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total: Rp $total'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Pesan Sekarang'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
