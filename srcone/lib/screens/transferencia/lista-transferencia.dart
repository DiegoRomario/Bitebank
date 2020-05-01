import 'dart:async';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario-transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = new List();
  @override
  _ListaTransferenciasState createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FormularioTransferencia();
                },
              ),
            ).then(atualizar);
          }),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemTransferencia(widget._transferencias[index]);
        },
      ),
    );
  }

  FutureOr<dynamic> atualizar(refTransferencia) {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        if (refTransferencia != null) {
          setState(() {
            widget._transferencias.add(refTransferencia);
          });
        }
      },
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.conta.toString()),
      ),
    );
  }
}
