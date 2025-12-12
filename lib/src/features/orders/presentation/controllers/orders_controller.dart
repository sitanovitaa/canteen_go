import 'package:canteen_go/src/features/orders/data/repo/orders_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersRepoProvider = Provider((ref) => OrdersRepo());

final ordersStreamProvider = StreamProvider<List<String>>((ref) {
  return ref.watch(ordersRepoProvider).watchOrders();
});
