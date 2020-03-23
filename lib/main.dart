import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Editor(
              controlador: _controladorNumeroConta,
              rotulo: 'Numero da conta',
              dica: '0000'),
          Editor(
              controlador: _controladorValor,
              rotulo: 'Valor',
              dica: '00.00',
              icon: Icons.monetization_on),
          RaisedButton(
            onPressed: () {
              final int numeroConta =
                  int.tryParse(_controladorNumeroConta.text);
              final double valor = double.tryParse(_controladorValor.text);
              if (numeroConta != null && valor != null) {
                Transferencia transferencia =
                    new Transferencia(valor, numeroConta);
              }
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final String rotulo;
  final String dica;
  final TextEditingController controlador;
  final IconData icon;

  Editor({this.controlador, this.rotulo, this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: controlador,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              icon: icon != null ? Icon(icon) : null,
              labelText: rotulo,
              hintText: dica,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ]),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(500, 1)),
        ItemTransferencia(Transferencia(200, 2)),
        ItemTransferencia(Transferencia(300, 3)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
