import 'package:canteen_go/src/features/menu/data/repo/menu_repo.dart';
import 'package:canteen_go/src/features/menu/domain/models/menu_item.dart';

class RefreshMenu {
  RefreshMenu(this._repo);
  final MenuRepo _repo;

  Future<List<MenuItem>> call({bool refresh = false}) {
    return _repo.fetchMenu(refresh: refresh);
  }
}
