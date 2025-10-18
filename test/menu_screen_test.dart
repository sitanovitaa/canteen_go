import 'package:canteen_go/src/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('menampilkan judul Menu dan item', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: CanteenGoApp()));
    expect(find.text('CanteenGo — Menu'), findsOneWidget);
    expect(find.text('Nasi Goreng'), findsOneWidget);
  });
}
