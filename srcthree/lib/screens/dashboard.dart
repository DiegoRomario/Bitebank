import 'package:flutter/material.dart';

import 'contact-list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Row(
            children: <Widget>[
              FeatureItem("Transfer", Icons.monetization_on),
              FeatureItem("Transfers Feed", Icons.description),
            ],
          )
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;

  const FeatureItem(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              (MaterialPageRoute(
                builder: (context) => ContactList(),
              )),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            width: 150,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Theme.of(context).accentColor,
                  size: 24,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
