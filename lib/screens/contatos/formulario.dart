import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/contatos/lista.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioContatoaState();
  }
}

class FormularioContatoaState extends State<FormularioContato> {
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
                  final novoContato = Contato(nome, numeroConta);
                  Navigator.pop(context, novoContato);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
