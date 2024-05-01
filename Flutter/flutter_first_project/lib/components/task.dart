import 'package:flutter/material.dart';
import 'package:flutter_first_project/components/difficulty.dart';
import 'package:flutter_first_project/data/task_dao.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  int nivel;

  Task(this.nome, this.foto, this.dificuldade,[this.nivel = 0, Key? key]): super(key: key);



  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int maestria = 0;

  bool assetOrNetwork() {
    if (widget.foto.contains('htttp')) {
      return true;
    }
    return false;
  }

  Map<int, Color> coresMaestria = {
    0: Colors.blue,
    1: Colors.green,
    2: Colors.red,
    3: Colors.purpleAccent,
    4: Colors.black,
  };

  Color corlevel() {
    if (widget.nivel >= widget.dificuldade * 10 && maestria < 4) {
      maestria++;
      widget.nivel = 0;
    }
    return coresMaestria[maestria] ?? Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: corlevel(),
            ),
          ),
          Column(
            children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26,
                            ),
                            width: 72,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: assetOrNetwork()
                                  ? Image.asset(
                                      widget.foto,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      widget.foto,
                                      fit: BoxFit.cover,
                                    ),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 200,
                                child: Text(
                                  widget.nome,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            Difficulty(widget: widget),
                          ],
                        ),
                        ElevatedButton(
                          //onLongPress para deletar uma tarefa!
                          onLongPress: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text(
                                        "Tem certeza que deseja excluir a Tarefa?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {Navigator.pop(context);},
                                          child: const Text("Não")),
                                      TextButton(
                                        onPressed: () {
                                          TaskDao().delete(widget.nome);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Sim"),
                                      )
                                    ],
                                  )),
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                            TaskDao().save(Task(widget.nome, widget.foto, widget.dificuldade, widget.nivel));
                          },
                          child: const Icon(
                            Icons.arrow_circle_up_rounded,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Colors.blue),
                        ),
                      ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Nível: ${widget.nivel}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
