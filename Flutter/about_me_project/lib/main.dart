import 'package:about_me_project/screens/Home%20View/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Bruno Pires ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'MontSerrat', fontSize: 17),
            titleMedium: TextStyle(fontWeight: FontWeight.bold)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      ),
      home: Home_View(),
    );
  }
}
