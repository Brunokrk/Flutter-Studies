import 'package:flutter/material.dart';
import 'package:flutter_first_project/components/user_level.dart';
import 'package:flutter_first_project/data/task_inherited.dart';
import 'package:flutter_first_project/screens/form_screen.dart';
import 'package:flutter_first_project/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: TaskInherited(child: const InitialScreen()),
      //TaskInherited(child: const InitialScreen()),
    );
  }
}

class Exercise extends StatefulWidget {
  const Exercise(this.color1, this.color2, this.color3, {super.key});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color1,
                border: Border.all(width: 2, color: Colors.black26)),
            height: 140,
            width: 110,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color2,
                border: Border.all(width: 2, color: Colors.black26)),
            height: 140,
            width: 110,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color3,
                border: Border.all(width: 2, color: Colors.black26)),
            height: 140,
            width: 110,
          )
        ],
      ),
    );
  }
}
