import 'package:canteen_go/src/features/orders/data/repo/orders_repo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrdersRepo', () {
    late OrdersRepo ordersRepo;

    setUp(() {
      ordersRepo = OrdersRepo();
    });

    test('watchOrders emits expected statuses in order', () {
      expect(
        ordersRepo.watchOrders(),
        emitsInOrder([
          ['#1001 (Pending)'],
          // Skip the delay since we can't easily fast-forward recursive async* delays
          // without more complex mock/time setup, but `emitsInOrder` waits for stream events.
          ['#1001 (Preparing)'],
          ['#1001 (Delivered)'],
          ['#1001 (Completed)'],
        ]),
      );
    });
  });
}
