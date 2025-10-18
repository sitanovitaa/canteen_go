import 'package:flutter/material.dart';
import '../../../../app/layout/breakpoints.dart';
import '../../../../app/theme/tokens.dart';
import 'menu_card.dart';
import '../../../../common/widgets/skeleton.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  int _columnsForWidth(double w) {
    if (w < Breakpoints.tablet) return 2;      // phone
    if (w < Breakpoints.desktop) return 3;     // tablet
    return 4;                                  // desktop
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = _columnsForWidth(w);

    // Data dummy UI-first
    final items = [
      ['Nasi Goreng', 20000],
      ['Mie Ayam', 18000],
      ['Es Teh Manis', 6000],
      ['Soto Ayam', 22000],
      ['Bakso', 20000],
      ['Ayam Geprek', 23000],
    ];

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(Tokens.l),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                final item = items[i];
                return MenuCard(title: item[0] as String, price: item[1] as int);
              },
              childCount: items.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              crossAxisSpacing: Tokens.l,
              mainAxisSpacing: Tokens.l,
              childAspectRatio: 4/3,
            ),
          ),
        ),
      ],
    );
  }
}
