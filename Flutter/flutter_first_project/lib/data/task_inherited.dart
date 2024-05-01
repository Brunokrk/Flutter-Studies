import 'package:flutter/material.dart';
import 'package:flutter_first_project/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  List<Task> taskList = [
    Task("Aprender Flutter", "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 3),
    Task("Andar de Bike", "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 2),
    Task("Meditar", "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 5),
    Task("Estudar", "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 4),
  ];

  void newTask(String name, String photo,int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  // void newTask(String name, String photo, int difficulty) {
  //   taskList = List.from(taskList)
  //     ..add(Task(name, photo, difficulty));
  // }


  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
