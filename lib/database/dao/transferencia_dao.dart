import 'package:bytebank/models/transferencias.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class TransferenciaDAO {
  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_numeroConta INTEGER, '
      '$_valor REAL)';

  static const String _tableName = 'transferencia';
  static const String _id = 'id';
  static const String _numeroConta = 'numero_conta';
  static const String _valor = 'valor';

  Future<int> save(Transferencia transferencia) async {
    final Database db = await createDatabase();
    Map<String, dynamic> transferenciaMap = _toMap(transferencia);
    return db.insert('$_tableName', transferenciaMap);
  }

  Map<String, dynamic> _toMap(Transferencia transferencia) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap['$_numeroConta'] = transferencia.numeroConta;
    transferenciaMap['$_valor'] = transferencia.valor.toString();
    return transferenciaMap;
  }

  Future<List<Transferencia>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query("$_tableName");
    List<Transferencia> transferencias = _toList(result);
    return transferencias;
  }

  List<Transferencia> _toList(List<Map<String, dynamic>> result) {
    final List<Transferencia> transferencias = List();
    for (Map<String, dynamic> row in result) {
      final Transferencia transferencia = Transferencia(
        row['$_id'],
        row['$_numeroConta'],
        row['$_valor'],
      );
      transferencias.add(transferencia);
    }
    return transferencias;
  }
}
