// To parse this JSON data, do

import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? id;
  String username;
  String number;
  String city;

  Users({
    this.id,
    required this.username,
    required this.number,
    required this.city,

  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    id: json["id"],
    username: json["username"],
    number: json["number"],
    city: json["city"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "number": number,
    "city": city,
  };
}
