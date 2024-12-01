import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/domain/usecases/delete_user.dart';
import 'package:agenda_clinica/domain/usecases/edit_user.dart';
import 'package:agenda_clinica/domain/usecases/save_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  final SaveUser saveUserUseCase;
  final EditUser editUserUseCase;
  final DeleteUser deleteUserUseCase;
  
  UserProvider({
    required this.saveUserUseCase,
    required this.editUserUseCase,
    required this.deleteUserUseCase,
  });
  
  final List<User> _users = [];
  User? _selectedUser;

  List<User> get users => _users;
  User? get selectedUser => _selectedUser;


  void selectUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }

  Future<void> saveUser(User user) async {
    await saveUserUseCase(user);
    _users.add(user);
    notifyListeners();
  }

  Future<void> editUser(User user) async {
    await editUserUseCase(user);
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) _users[index] = user;
    notifyListeners();
  }

  Future<void> deleteUser(String userId) async {
    await deleteUserUseCase(userId);
    _users.removeWhere((user) => user.id == userId);
    notifyListeners();
  }
}
