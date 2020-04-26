import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/home/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
  save(Contato(0, 'Lucas', 10000)).then((id) {
    findAll().then((contatos) => debugPrint(contatos.toString()));
  });
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
