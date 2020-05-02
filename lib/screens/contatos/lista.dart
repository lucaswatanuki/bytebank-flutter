import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/contatos/formulario.dart';
import 'package:flutter/material.dart';

class ListaContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Loading"),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final Contato contato = contatos[index];
                  return _ItemContato(contato);
                },
                itemCount: contatos.length,
              );
              break;
          }
          return Text("Erro inesperado.");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioContato(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class _ItemContato extends StatelessWidget {
  final Contato contato;
  _ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
