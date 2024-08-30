import 'package:flutter/material.dart';
import 'package:studying_app/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerDelegate: routes.routerDelegate,
      routeInformationProvider: routes.routeInformationProvider,
      routeInformationParser: routes.routeInformationParser ,
    );
  }
}

