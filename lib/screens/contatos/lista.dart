import 'package:flutter/material.dart';

class ListaContato extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaContatoState();
  }
}

class ListaContatoState extends State<ListaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
    );
  }
}
