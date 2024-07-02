import 'package:flutter_first_project/components/task.dart';
import 'package:flutter_first_project/data/task_inherited.dart';
import 'package:flutter/material.dart';

class UserLevel extends StatefulWidget {
  const UserLevel({super.key});

  @override
  State<UserLevel> createState() => _UserLevelState();
}

class _UserLevelState extends State<UserLevel> {

  double _getUserLevel() {
    double level = 0;

    for (Task task in TaskInherited.of(context).taskList) {
      level += (task.nivel / 10) * task.dificuldade;
    }

    return level;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(8.0)),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Text(
                  'Level ${_getUserLevel().toInt()}',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                color: Colors.black,
                value: (_getUserLevel()) / 100.0,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {

                  });
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
