import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/widgets/centered-message.dart';
import 'package:bytebank/widgets/loader.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Transaction> transactions = snapshot.data;
            if (transactions.length <= 0) {
              return CenteredMessage(
                "Not found",
                icon: Icons.warning,
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                final Transaction transaction = transactions[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text(
                      transaction.value.toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      transaction.contact.accountNumber.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          } else {
            return CenteredMessage(
              "Unknown error",
              icon: Icons.error,
            );
          }
        },
      ),
    );
  }
}
