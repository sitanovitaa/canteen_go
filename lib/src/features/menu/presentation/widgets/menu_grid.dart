import 'package:canteen_go/src/app/layout/breakpoints.dart';
import 'package:canteen_go/src/app/theme/tokens.dart';
import 'package:canteen_go/src/common/widgets/error_state.dart';
import 'package:canteen_go/src/features/menu/presentation/controllers/menu_controller.dart';
import 'package:canteen_go/src/features/menu/presentation/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuGrid extends ConsumerWidget {
  const MenuGrid({super.key});

  int _columnsForWidth(double w) {
    if (w < Breakpoints.tablet) return 2; // phone
    if (w < Breakpoints.desktop) return 3; // tablet
    return 4; // desktop
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = MediaQuery.of(context).size.width;
    final cols = _columnsForWidth(w);

    final asyncItems = ref.watch(menuControllerProvider);

    return asyncItems.when(
      data: (items) {
        if (items.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Menu kosong untuk saat ini')),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.all(Tokens.l),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, i) {
              final item = items[i];
              return MenuCard(id: item.id, title: item.name, price: item.price);
            }, childCount: items.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              crossAxisSpacing: Tokens.l,
              mainAxisSpacing: Tokens.l,
              childAspectRatio: 3 / 4,
            ),
          ),
        );
      },
      loading: () => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => const SliverFillRemaining(
        hasScrollBody: false,
        child: ErrorState(title: 'Gagal memuat menu'),
      ),
    );
  }
}
