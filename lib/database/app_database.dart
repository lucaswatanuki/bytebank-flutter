import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:bytebank/database/dao/transferencia_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), "bytebank.db");
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(ContatoDAO.tableSQL);
      await db.execute(TransferenciaDAO.tableSQL);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
