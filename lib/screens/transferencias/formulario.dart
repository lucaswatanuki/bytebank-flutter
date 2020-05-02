import 'package:bytebank/components/editor.dart';
import 'package:bytebank/components/error_dialogue.dart';
import 'package:bytebank/database/dao/transferencia_dao.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';

const appBarTitle = 'Adicionar Transferência';
const dicaText = '0000';
const numeroConta = 'Número da conta';
const valor = 'Valor';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TransferenciaDAO transferenciaDAO = TransferenciaDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: dicaText,
                rotulo: numeroConta,
              ),
              Editor(
                dica: dicaText,
                controlador: _controladorCampoValor,
                rotulo: valor,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criaTransferencia(context),
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(0, numeroConta, valor);
      transferenciaDAO.save(transferenciaCriada);
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) => ErrorDialogue(
            "Informar número de conta e valor de transferência válidos."),
      );
    }
  }
}
