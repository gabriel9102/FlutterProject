import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';


abstract class IOrderRepository {
 Future<void> addingNewOrder(OrderMaster newOrderForInclude);
  Future<void> deletingExistingOrder(int id);
  Future<List<OrderMaster>> getAllOrders();
}