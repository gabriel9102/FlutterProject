import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_refactored/src/config/routes.dart';
import 'package:clean_architecture_refactored/src/data/providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
//eu crio a routes.dart chamando meu componente
//widget_orders e chamo o routes na main.
    final databaseGen = ref.read(databaseProvider).init();
    // return MaterialApp.router(
    //   routerConfig: routes,
    //   title: 'Orders List',
    //   theme: ThemeData(
    //     primarySwatch: Colors.deepPurple,
    //   ),
    // );
    return FutureBuilder<void>(
        future: databaseGen,
        builder: (context, snapshot) {
          // Enquanto o banco está inicializando, mostra uma tela de carregamento
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Caso ocorra algum erro na inicialização
          if (snapshot.hasError) {
            return Center(
                child: Text('Error initializing database: ${snapshot.error}'));
          }

          // Se a inicialização foi bem-sucedida, renderiza o aplicativo
          return MaterialApp.router(
            routerConfig: routes,
            title: 'Orders List',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
          );
        });
  }
}

