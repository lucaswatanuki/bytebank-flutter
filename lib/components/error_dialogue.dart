import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialogue extends StatelessWidget {

  final String problema;

  ErrorDialogue(this.problema);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Erro"),
      content: new Text(problema),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text("Fechar"))
      ],
    );
  }
}