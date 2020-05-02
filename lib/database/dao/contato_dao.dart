import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContatoDAO {
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
}
