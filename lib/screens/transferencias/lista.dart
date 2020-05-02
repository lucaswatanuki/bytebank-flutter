import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencias/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = new List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) =>
              _atualizaTransferencia(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualizaTransferencia(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
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
      title: Text("Valor: " + _transferencia.valor.toString()),
      subtitle: Text("C/C: " + _transferencia.numeroConta.toString()),
    ));
  }
}
