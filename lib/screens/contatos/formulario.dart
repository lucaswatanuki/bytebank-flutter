import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoaState createState() {
    return _FormularioContatoaState();
  }
}

class _FormularioContatoaState extends State<FormularioContato> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Contato"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _nomeController,
              rotulo: "Nome completo",
            ),
            Editor(
              controlador: _numeroContaController,
              rotulo: "Numero conta",
            ),
            SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  final String nome = _nomeController.text;
                  final int numeroConta =
                      int.tryParse(_numeroContaController.text);
                  final Contato novoContato = new Contato(0, nome, numeroConta);
                  save(novoContato);
                  Navigator.pop(context, novoContato);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
