// test/menu_grid_responsive_test.dart (contoh ringkas)
import 'package:canteengo/src/features/menu/presentation/widgets/menu_grid.dart';
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
