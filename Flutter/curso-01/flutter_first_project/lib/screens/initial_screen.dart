import 'package:flutter_first_project/components/task.dart';
import 'package:flutter_first_project/components/user_level.dart';
import 'package:flutter_first_project/data/task_dao.dart';
import 'package:flutter_first_project/data/task_inherited.dart';
import 'package:flutter_first_project/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isOpacity = true;
  IconData visibilityIcon = Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            leading: const Icon(
              Icons.list_alt,
              color: Colors.black54,
              size: 32,
            ),
            title: const Text(
              'Tasks',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {

                        });
                      },
                      icon: Icon(Icons.refresh, color: Colors.black54,),
                    ),
                    IconButton(
                      onPressed: visibilityOnOff,
                      icon: Icon(
                        visibilityIcon,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: AnimatedOpacity(
            opacity: isOpacity ? 1 : 0,
            duration: const Duration(
              milliseconds: 800,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65, bottom: 70),
                  child: FutureBuilder<List<Task>>(
                    future: TaskDao().findAll(),
                    builder: (context, snapshot) {
                      List<Task>? items = snapshot.data;
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('Carregando'),
                              ],
                            ),
                          );

                        case ConnectionState.waiting:
                          return Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('Carregando'),
                              ],
                            ),
                          );

                        case ConnectionState.active:
                          return Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('Carregando'),
                              ],
                            ),
                          );

                        case ConnectionState.done:
                          if (snapshot.hasData && items != null) {
                            if (items.isNotEmpty) {
                              return ListView.builder(
                                  itemCount: items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Task tarefa = items[index];
                                    print("AQUI");
                                    //print(tarefa.nivel);
                                    print(items.last.nivel);

                                    return tarefa;
                                  });
                            }
                            return Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 128,
                                  ),
                                  Text(
                                    'Não há nenhuma Tarefa',
                                    style: TextStyle(fontSize: 32),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Text('Erro ao carregar Tarefas ');
                      }
                      return Text('Erro desconhecido');
                    },
                  ),
                ),
                const UserLevel(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.greenAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (newContext) => FormScreen(
                    taskContext: context,
                  ),
                ),
              ).then((value) => setState(() {
                    print('Recarregando a tela inicial');
                  }));
            },
            child: const Icon(
              Icons.add,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  void visibilityOnOff() {
    setState(() {
      isOpacity = !isOpacity;
      visibilityIcon =
          isOpacity ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    });
  }
}
