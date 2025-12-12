import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';

abstract class MenuRepo {
  Future<List<MenuItem>> fetchMenu();
}

class FakeMenuRepo implements MenuRepo {
  @override
  Future<List<MenuItem>> fetchMenu() async {
    await Future.delayed(const Duration(milliseconds: 350));
    return const [
      MenuItem(id: 'm1', name: 'Nasi Goreng', price: 20000),
      MenuItem(id: 'm2', name: 'Mie Ayam', price: 18000),
      MenuItem(id: 'm3', name: 'Es Teh Manis', price: 6000),
      MenuItem(id: 'm4', name: 'Soto Ayam', price: 22000),
      MenuItem(id: 'm5', name: 'Bakso', price: 20000),
      MenuItem(id: 'm6', name: 'Ayam Geprek', price: 23000),
    ];
  }
}
