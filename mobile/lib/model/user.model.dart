import 'package:flutter/material.dart';

class User {
  String id;
  String imageUrl;
  String firstname;
  String lastname;
  String name;
  String username;
  String dob;

  User({
    @required this.id,
    @required this.imageUrl,
    @required this.firstname,
    @required this.lastname,
    @required this.name,
    @required this.username,
    @required this.dob,
  }) {
    this.name = '${this.firstname} ${this.lastname}';
  }
}
