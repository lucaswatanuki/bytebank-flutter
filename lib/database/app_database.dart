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

Future<int> save(Contato contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contatosMap = Map();
    contatosMap['nome'] = contato.nome;
    contatosMap['numero_conta'] = contato.numeroConta;
    return db.insert('contato', contatosMap);
  });
}

Future<List<Contato>> findAll() {
  return createDatabase().then((db) {
    return db.query('contato').then((contatoMaps) {
      final List<Contato> contatos = List();
      for (Map<String, dynamic> map in contatoMaps) {
        final Contato contato = Contato(
          map['id'],
          map['nome'],
          map['numero_conta'],
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}
