import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), "bytebank.db");
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute('CREATE TABLE contato('
              'id INTEGER PRIMARY KEY, '
              'nome TEXT, '
              'numero_conta INTEGER)'
      );
      await db.execute('CREATE TABLE transferencia('
          'id INTEGER PRIMARY KEY, '
          'numero_conta INTEGER, '
          'valor REAL)');
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
