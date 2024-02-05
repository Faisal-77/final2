import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'json/users.dart';

class SqlDb {
  final databaseName = "userdb2.db";

  // Table
  String user = '''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      number TEXT,
      city TEXT
      
    )
    ''';
  Future<Database> intialDb() async {
    final databasepath = await getDatabasesPath();
    final path = join(databasepath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(user);
    });
  }

  Future<Users> loginUser(Users usr) async {
    final Database db = await intialDb();
    final result = await db.rawQuery(
        "select * from users where username = '${usr.username}' AND number = '${usr.number}'");
    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      throw Exception("username or number not found");
    }
  }

  Future<int> createUser(Users usr) async {
    final Database db = await intialDb();
    return db.rawInsert(
        "INSERT INTO 'users' ('username', 'number', 'city') VALUES ('${usr.username}', '${usr.number}', '${usr.city}')");
  }

  Future<int> deleteUser(Users usr) async {
    final Database db = await intialDb();
    return await db.rawDelete('DELETE FROM users where id =?', ['${usr.id}']);
  }

  Future<int> updateUser(Users usr) async {
    final Database db = await intialDb();
    return await db.rawUpdate(
        "UPDATE users SET username = '${usr.username}', number = '${usr.number}', city='${usr.city}' WHERE id = '${usr.id}'");
  }
  Future<Users?> getUser(int userId) async {
    final Database db = await intialDb();
    List<Map> list = await db.rawQuery('SELECT * FROM users WHERE id = $userId');

    if (list.isNotEmpty) {
      return Users.fromMap(list.first as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  // A method that retrieves all the users from the users table.
  Future<List<Users>> getAllUsers() async {
    final Database db = await intialDb();
    List<Map> list = await db.rawQuery('SELECT * FROM users');
    return list
        .map((usr) => Users.fromMap(usr as Map<String, dynamic>))
        .toList();
  }
}
