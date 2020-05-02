import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/widgets/centered-message.dart';
import 'package:bytebank/widgets/loader.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: findAll(),
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return Loader();
          } else if (ConnectionState.done == snapshot.connectionState) {
            if (snapshot.hasData) {
              final List<Transaction> transactions = snapshot.data;
              if (transactions.isNotEmpty) {
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
              }
              return CenteredMessage(
                'No transactions found',
                icon: Icons.warning,
              );
            }
          }
          return CenteredMessage('Unknown error', icon: Icons.error);
        },
      ),
    );
  }
}
