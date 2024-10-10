import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/core/domain/repositories/iorder_repository.dart';

class AddOrder {
  final IOrderRepository repository;

  AddOrder(this.repository);

  Future<void> execute(String description) async {
    if (description.isEmpty){
      throw Exception("A descrição não pode estar vazia.");
    }else{
      final newOrderForInclude =
      OrderMaster(description: description, date: DateTime.now());
      await repository.addingNewOrder(newOrderForInclude);
    }
  }
}
