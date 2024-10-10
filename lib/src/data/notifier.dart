import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/core/application/usecases/add_order.dart';
import 'package:clean_architecture_refactored/src/core/application/usecases/delete_order.dart';
import 'package:clean_architecture_refactored/src/core/application/usecases/get_list.dart';

class OrderNotifier extends StateNotifier<List<OrderMaster>> {
  final GetList getListUseCase;
  final AddOrder addOrderUseCase;
  final DeleteOrder deleteOrderUseCase;

  OrderNotifier(this.getListUseCase, this.addOrderUseCase, this.deleteOrderUseCase) : super([]) {
    loadOrders(); // Carrega as ordens ao inicializar
  }

  // Método para carregar ordens usando o caso de uso GetList
  Future<void> loadOrders() async {
    final orders = await getListUseCase.execute();
    state = orders; // Atualiza o estado com a lista de ordens
  }

  // Método para adicionar uma nova ordem
  Future<void> addOrder(String description) async {
    await addOrderUseCase.execute(description); // Usa o caso de uso para adicionar
    loadOrders(); // Recarrega a lista de ordens após adicionar
  }

  // Método para deletar uma ordem
  Future<void> deleteOrder(int orderId) async {
    await deleteOrderUseCase.execute(orderId); // Usa o caso de uso para deletar
    loadOrders(); // Recarrega a lista de ordens após deletar
  }
}
