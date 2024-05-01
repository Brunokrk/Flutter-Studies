//Objeto para as manipulações no banco de dados.
import 'package:flutter_first_project/components/task.dart';
import 'package:flutter_first_project/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  //tabela deve ser a mesma, independente do objeto
  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT, '
      '$_level INTEGER)';

  static String _tablename = 'teste';
  static String _difficulty = 'dificuldade';
  static String _image = 'imagem';
  static String _name = 'nome';
  static String _level = 'nivel';

  save(Task tarefa) async {
    var updateResponse;
    print('Iniciando o save');
    final Database banco = await getDatabase();
    print('Banco de dados encontrado em: $banco');

    var itemExists = await find(tarefa.nome);
    print('Tarefa encontrada${itemExists}');

    Map<String, dynamic> taskMap = toMap(tarefa);
    print('Mapa criado: $taskMap');

    if (itemExists.isEmpty) {
      print('A tarefa não Existe.');
      return await banco.insert(_tablename, taskMap);
    } else {
      //item já existe, alterar tudo baseado no nome!
      print('A tarefa já existe!');
      updateResponse = await banco.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
      print(updateResponse);
      return updateResponse;
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo Tarefa em Map:');
    final Map<String, dynamic> mapDeTarefas = Map();
    mapDeTarefas[_name] = tarefa.nome;
    mapDeTarefas[_difficulty] = tarefa.dificuldade;
    mapDeTarefas[_image] = tarefa.foto;
    mapDeTarefas[_level] = tarefa.nivel;
    return mapDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print("Acessando o findAll: ");
    //Como getDatabase é do tipo Future, devemos esperar que ele temine, portanto usamos o await
    final Database banco = await getDatabase();
    //Agora armazenamos tudo na variável result
    final List<Map<String, dynamic>> result = await banco.query(_tablename);
    print('Procurando dados no banco de dados ...  encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty], linha[_level]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find:');
    final Database banco = await getDatabase();
    final List<Map<String, dynamic>> result = await banco
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  } //Acho que o retorno aqui está incorreto

  delete(String nomeDaTarefa) async {
    print('Deletando a tarefa $nomeDaTarefa');
    final Database banco = await getDatabase();
    return banco.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
