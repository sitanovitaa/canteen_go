import 'package:canteen_go/src/features/menu/data/repo/menu_repo.dart';
import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';
import 'package:canteen_go/src/features/menu/presentation/controllers/menu_controller.dart';
import 'package:canteen_go/src/features/menu/presentation/widgets/menu_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeMenuRepo implements MenuRepo {
  @override
  Future<List<MenuItem>> fetchMenu({bool refresh = false}) async {
    return const [MenuItem(id: '1', name: 'Nasi Goreng', price: 15000)];
  }
}

void main() {
  testWidgets('MenuGrid renders', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [menuRepoProvider.overrideWithValue(FakeMenuRepo())],
        child: const MaterialApp(
          home: Scaffold(body: CustomScrollView(slivers: [MenuGrid()])),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Nasi Goreng'), findsOneWidget);
  });
}
