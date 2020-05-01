import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController pcontroller;
  final String plabel;
  final String phint;
  final IconData picon;

  const Editor({this.pcontroller, this.plabel, this.phint, this.picon});

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
