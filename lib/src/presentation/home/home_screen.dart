import 'package:clean_architecture_refactored/src/core/domain/entities/order.dart';
import 'package:clean_architecture_refactored/src/data/providers.dart';
import 'package:clean_architecture_refactored/src/presentation/home/widgets/cards/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders List'),
      ),
      body: Column(
        children: [
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Order Description'),
          ),
           ElevatedButton(
             onPressed:() async{
               final description = descriptionController.text;
                ref.read(orderListNotifierProvider.notifier).addOrder(description)
                  .then((_) {
                    descriptionController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tarefa adicionada!'), backgroundColor: Colors.green),
                    );
                  }).onError((error, stack) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.toString()), backgroundColor: Colors.red),
                    );
                  });
               ;
             },
             child: const Text('Adding Order!'),
           ),
          TaskCard()
        ],
      ),
    );
  }
}
