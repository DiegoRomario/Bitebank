import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactNew extends StatefulWidget {
  @override
  _ContactNewState createState() => _ContactNewState();
}

class _ContactNewState extends State<ContactNew> {
  final TextEditingController _fullnameController = new TextEditingController();
  final TextEditingController _accountnumberController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _fullnameController,
              decoration: InputDecoration(
                labelText: "Full name",
              ),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _accountnumberController,
                decoration: InputDecoration(
                  labelText: "Account number",
                ),
                style: TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    final String name = _fullnameController.text;
                    final int accountNumber =
                        int.tryParse(_accountnumberController.text);
                    final contact = new Contact(name, accountNumber);
                    Navigator.pop(context, contact);
                  },
                  child: Text("Create"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
