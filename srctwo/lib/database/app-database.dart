import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    //  onDowngrade: onDatabaseDowngradeDelete
  );
}

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
