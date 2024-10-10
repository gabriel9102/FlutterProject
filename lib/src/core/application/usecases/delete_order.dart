import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/core/domain/repositories/iorder_repository.dart';
import 'package:clean_architecture_refactored/src/data/providers.dart';
import 'package:riverpod/src/provider.dart';

class DeleteOrder{
  final IOrderRepository repository;

  DeleteOrder(this.repository);

  Future<void> execute(int id) async{
    await repository.deletingExistingOrder(id);
  }
}