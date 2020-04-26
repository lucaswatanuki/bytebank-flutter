import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contato('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'numero_conta INTEGER)');
    }, version: 1);
  });
}

void save(Contato contato) {
  createDatabase().then((db) {
    final Map<String, dynamic> contatosMap = Map();
    contatosMap['id'] = contato.id;
    contatosMap['nome'] = contato.nome;
    contatosMap['numero_conta'] = contato.numeroConta;
    db.insert('contato', contatosMap);
  });
}
