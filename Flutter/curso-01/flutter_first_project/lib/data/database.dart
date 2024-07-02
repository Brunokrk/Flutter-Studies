import 'package:flutter_first_project/data/task_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  //função demora um certo tempo e precisamos esperar que o caminho seja encontrado para então continuar
  final String path = join(await getDatabasesPath(),
      'task1.db'); //Vai buscar pelo caminho perfeito dentro do nosso dispositivo

  //Vai retornar o banco de dados, e caso ele não exista, vai criar uma tabela para tal

  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tableSql);
  }, version: 1);
}
