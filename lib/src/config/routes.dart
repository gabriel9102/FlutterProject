import 'package:go_router/go_router.dart';
import 'package:clean_architecture_refactored/src/presentation/home/home_screen.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context,state) => const HomeScreen(),
    ),
  ]);