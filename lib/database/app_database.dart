import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), "bytebank.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contato('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'numero_conta INTEGER)');
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Contato contato) async {
  final Database db = await createDatabase();
  final Map<String, dynamic> contatosMap = Map();
  contatosMap['nome'] = contato.nome;
  contatosMap['numero_conta'] = contato.numeroConta;
  return db.insert('contato', contatosMap);
}

Future<List<Contato>> findAll() async {
  final Database db = await createDatabase();
  final List<Map<String, dynamic>> result = await db.query("contato");
  final List<Contato> contatos = List();
  for (Map<String, dynamic> row in result) {
    final Contato contato = Contato(
      row['id'],
      row['nome'],
      row['numero_conta'],
    );
    contatos.add(contato);
  }
  return contatos;
}
