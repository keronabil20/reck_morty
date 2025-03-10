import 'package:flutter/material.dart';
import 'app_router.dart';

void main(List<String> args) {
  runApp(Reck_MortyApp(
    appRouter: AppRouter(),
  ));
}

class Reck_MortyApp extends StatelessWidget {
  final AppRouter appRouter;

  const Reck_MortyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
