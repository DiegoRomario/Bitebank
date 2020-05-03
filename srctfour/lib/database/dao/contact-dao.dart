import 'package:bytebank/models/contact.dart';
import '../app-database.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  Future<int> save(Contact contact) async {
    Database db = await getDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  }

  Future<List<Contact>> findAll() async {
    Database db = await getDatabase();
    List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contacts = List();
    for (Map<String, dynamic> map in result) {
      contacts.add(
        Contact(
          map['id'],
          map['name'],
          map['account_number'],
        ),
      );
    }
    return contacts;
  }
}
