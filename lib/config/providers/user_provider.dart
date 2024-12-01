import 'package:agenda_clinica/domain/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _users = [];
  User? _selectedUser;

  List<User> get users => _users;
  User? get selectedUser => _selectedUser;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void selectUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }
}
