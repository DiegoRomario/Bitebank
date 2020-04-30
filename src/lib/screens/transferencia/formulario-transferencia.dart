import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerConta = new TextEditingController();
  final TextEditingController _controllerValor = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando Transferencia"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  pcontroller: _controllerConta,
                  phint: "000000-0",
                  picon: Icons.credit_card,
                  plabel: "Numero da conta"),
              Editor(
                  pcontroller: _controllerValor,
                  phint: "0,00",
                  picon: Icons.monetization_on,
                  plabel: "R\$ Valor"),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  transferir(context);
                },
                child: Text("Transferir"),
              )
            ],
          ),
        ));
  }

  void transferir(BuildContext context) {
    final String conta = _controllerConta.text;
    final double valor = double.tryParse(_controllerValor.text);
    final transferencia = Transferencia(valor, conta);
    Navigator.pop(context, transferencia);
  }
}
