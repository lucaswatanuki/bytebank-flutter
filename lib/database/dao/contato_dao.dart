import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContatoDAO {
  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_numeroConta INTEGER)';

  static const String _tableName = 'contato';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  Future<int> save(Contato contato) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contatosMap = _toMap(contato);
    return db.insert('$_tableName', contatosMap);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contatosMap = Map();
    contatosMap['$_nome'] = contato.nome;
    contatosMap['$_numeroConta'] = contato.numeroConta;
    return contatosMap;
  }

  Future<List<Contato>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query("$_tableName");
    List<Contato> contatos = _toList(result);
    return contatos;
  }

  List<Contato> _toList(List<Map<String, dynamic>> result) {
    final List<Contato> contatos = List();
    for (Map<String, dynamic> row in result) {
      final Contato contato = Contato(
        row['$_id'],
        row['$_nome'],
        row['$_numeroConta'],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
