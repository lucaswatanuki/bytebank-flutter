import 'package:bytebank/components/loading_component.dart';
import 'package:bytebank/database/dao/transferencia_dao.dart';
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
  final TransferenciaDAO transferenciaDAO = TransferenciaDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: FutureBuilder<List<Transferencia>>(
          initialData: List(),
          future: transferenciaDAO.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                break;
              case ConnectionState.active:
                return LoadingComponent();
                break;
              case ConnectionState.done:
                final List<Transferencia> transferencias = snapshot.data;
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final Transferencia transferencia = transferencias[index];
                    return _ItemTransferencia(transferencia);
                  },
                  itemCount: transferencias.length,
                );
                break;
            }
            return Text("Erro inesperado.");
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTransferencia(),
            ),
          );
        },
      ),
    );
  }
}

class _ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  _ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(
        "Valor: " + transferencia.valor.toString(),
      ),
      subtitle: Text(
        "C/C: " + transferencia.numeroConta.toString(),
      ),
      leading: Icon(Icons.monetization_on),
    ));
  }
}
