import 'package:canteen_go/src/features/menu/presentation/widgets/menu_grid.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [MenuGrid()]);
  }
}
