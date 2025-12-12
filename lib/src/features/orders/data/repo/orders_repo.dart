import 'dart:async';

class OrdersRepo {
  Stream<List<String>> watchOrders() async* {
    yield const ['#1001 (Pending)'];
    await Future.delayed(const Duration(seconds: 2));
    yield const ['#1001 (Preparing)'];
    await Future.delayed(const Duration(seconds: 2));
    yield const ['#1001 (Delivered)'];
    await Future.delayed(const Duration(seconds: 2));
    yield const ['#1001 (Completed)'];
  }
}
