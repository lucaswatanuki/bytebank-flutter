import 'package:bytebank/models/transferencias.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class TransferenciaDAO {
  Future<int> save(Transferencia transferencia) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap['numero_conta'] = transferencia.numeroConta;
    transferenciaMap['valor'] = transferencia.valor.toString();
    return db.insert('transferencia', transferenciaMap);
  }

  Future<List<Transferencia>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query("transferencia");
    final List<Transferencia> transferencias = List();
    for (Map<String, dynamic> row in result) {
      final Transferencia transferencia = Transferencia(
        row['id'],
        row['numero_conta'],
        row['valor'],
      );
      transferencias.add(transferencia);
    }
    return transferencias;
  }
}
