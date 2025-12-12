import 'package:canteen_go/src/features/menu/presentation/widgets/menu_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MenuGrid renders', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: MenuGrid())),
    );
    expect(find.text('Nasi Goreng'), findsOneWidget);
  });
}
