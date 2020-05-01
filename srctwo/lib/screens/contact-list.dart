import 'package:bytebank/screens/contact-new.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                "Chico Silva",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "150",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => ContactNew(),
            ),
          )
              .then((onValue) {
            print(
              onValue.toString(),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
