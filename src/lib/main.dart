import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

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
            final Future<Transferencia> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTrasnferencia();
            }));
            future.then((onValue) {
              if (onValue != null) {
                print("estou no then");
                print(onValue);
                widget._transferencias.add(onValue);
              }
            });
          }),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemTransferencia(widget._transferencias[index]);
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.conta.toString()),
      ),
    );
  }
}

class FormularioTrasnferencia extends StatelessWidget {
  final TextEditingController _controllerConta = new TextEditingController();
  final TextEditingController _controllerValor = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando Transferencia"),
        ),
        body: Column(
          children: <Widget>[
            InputField(
                pcontroller: _controllerConta,
                phint: "000000-0",
                picon: Icons.credit_card,
                plabel: "Numero da conta"),
            InputField(
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
        ));
  }

  void transferir(BuildContext context) {
    final String conta = _controllerConta.text;
    final double valor = double.tryParse(_controllerValor.text);

    final transferencia = Transferencia(valor, conta);
    Navigator.pop(context, transferencia);
    debugPrint("No Transferir");
    debugPrint(transferencia.toString());
  }
}

class Transferencia {
  final double valor;
  final String conta;
  Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return "Valor: $valor | Conta: $conta";
  }
}

class InputField extends StatelessWidget {
  final TextEditingController pcontroller;
  final String plabel;
  final String phint;
  final IconData picon;

  const InputField({this.pcontroller, this.plabel, this.phint, this.picon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: pcontroller,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          icon: Icon(picon),
          hintText: phint,
          labelText: plabel,
        ),
      ),
    );
  }
}
