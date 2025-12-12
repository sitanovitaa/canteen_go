import 'package:canteen_go/src/app/theme/tokens.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      elevation: Tokens.e1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Tokens.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Tokens.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: Tokens.s),
            Text('Rp $price'),
            const SizedBox(height: Tokens.m),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_shopping_cart_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
