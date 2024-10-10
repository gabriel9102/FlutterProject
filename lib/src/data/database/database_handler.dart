import 'package:clean_architecture_refactored/objectbox.g.dart';
import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:objectbox/objectbox.dart';



class DatabaseHandler {
  late final Store _store;
  late final Box<OrderMaster> _orderBox;

  Box<OrderMaster> get orderBox => _orderBox;
  Store get store => _store;

  Future<void> init() async{
    _store = await openStore();
    _orderBox = _store.box<OrderMaster>();
  }
}











