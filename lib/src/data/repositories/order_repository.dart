import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/core/domain/repositories/iorder_repository.dart';
import 'package:objectbox/objectbox.dart';
import 'package:clean_architecture_refactored/objectbox.g.dart';

class OrderRepository implements IOrderRepository {
  final Store dataBase;
  OrderRepository(this.dataBase);

  @override
  Future<void> addingNewOrder(OrderMaster newOrderForInclude) async {
    dataBase.box<OrderMaster>().put(newOrderForInclude);
  }

  @override
  Future<void> deletingExistingOrder(int id) async{
    dataBase.box<OrderMaster>().remove(id);
  }

  @override
  Future<List<OrderMaster>> getAllOrders() async{
    return dataBase.box<OrderMaster>().getAll();
  }
}