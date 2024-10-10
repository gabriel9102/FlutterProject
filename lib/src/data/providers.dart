import 'package:clean_architecture_refactored/objectbox.g.dart';
import 'package:clean_architecture_refactored/src/core/application/usecases/add_order.dart';
import 'package:clean_architecture_refactored/src/core/application/usecases/delete_order.dart';
import 'package:clean_architecture_refactored/src/core/application/usecases/get_list.dart';
import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/core/domain/repositories/iorder_repository.dart';
import 'package:clean_architecture_refactored/src/data/database/database_handler.dart';
import 'package:clean_architecture_refactored/src/data/notifier.dart';
import 'package:clean_architecture_refactored/src/data/repositories/order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderRepositoryProvider = Provider<IOrderRepository>((ref) {
  final database = ref.read(databaseProvider);
  return OrderRepository(database.store);
});

final createOrderUseCase = Provider<AddOrder> ((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return AddOrder(repo);
});

final deleteOrderUseCase = Provider<DeleteOrder> ((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return DeleteOrder(repo);
});

final databaseProvider = Provider<DatabaseHandler>((ref) {
  return DatabaseHandler();
});

final getOrderUseCase = Provider<GetList>((ref){
  final repo = ref.read(orderRepositoryProvider);
  return GetList(repo);
});

final orderListNotifierProvider = StateNotifierProvider<OrderNotifier, List<OrderMaster>>((ref) {
  final getListUseCase = ref.read(getOrderUseCase);
  final addOrderUseCase = ref.read(createOrderUseCase);
  final deleteOrderUseCase2 = ref.read(deleteOrderUseCase);

  return OrderNotifier(getListUseCase, addOrderUseCase, deleteOrderUseCase2);
});
