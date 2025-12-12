import 'package:canteen_go/src/app/theme/tokens.dart';
import 'package:canteen_go/src/features/cart/domain/models/cart_item.dart';
import 'package:canteen_go/src/features/cart/presentation/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuCard extends ConsumerWidget {
  const MenuCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
  });

  final String id;
  final String title;
  final int price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: Tokens.e1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Tokens.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Tokens.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: Tokens.s),
            Text('Rp $price'),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .add(CartItem(menuId: id, name: title, price: price));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title ditambahkan ke keranjang'),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
