import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/data/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class TaskCard extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderList = ref.watch(orderListNotifierProvider);

    return Expanded(
      child: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          final order = orderList[index];
          return ListTile(
            title: Text(order.description),
            subtitle: Text(order.date.toString()),
            trailing: ElevatedButton(
              onPressed: () {
                ref.read(orderListNotifierProvider.notifier).deleteOrder(order.id);
              },
              child: Text('Delete Order'),
            ),
          );
        },
      ),
    );
  }
}