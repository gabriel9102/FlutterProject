import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/core/domain/repositories/iorder_repository.dart';

class GetList{
  final IOrderRepository repository;

  GetList(this.repository);

  Future<List<OrderMaster>> execute() async {
    return await repository.getAllOrders();
  }
}