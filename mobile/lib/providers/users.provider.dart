import 'package:datapac/model/user.model.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier {
  User user;

  User get currentUser {
    return this.currentUser;
  }

  updateUser(User user) {
    this.user = user;
  }
}
