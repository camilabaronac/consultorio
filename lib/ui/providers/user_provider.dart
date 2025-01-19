import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/delete_user.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/edit_user.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/get_users.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/save_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final SaveUser saveUserUseCase;
  final EditUser editUserUseCase;
  final DeleteUser deleteUserUseCase;
  final GetUsers getUsersUseCase;

  UserProvider({
    required this.saveUserUseCase,
    required this.editUserUseCase,
    required this.deleteUserUseCase,
    required this.getUsersUseCase,
  });

  late final List<User> _users = List.generate(
      10,
      (index) => User(
          name: 'Camila Barona Cabrera',
          age: 24,
          id: '123456789',
          idType: 'Cédula de Ciudadania',
          email: 'c@b.com',
          birthDate: DateTime.now(),
          phone: 123456789,
          ),
  );

  User _selectedUser = User(
      name: 'Camila Barona Cabrera',
      age: 24,
      id: '123456789',
      idType: 'Cédula de Ciudadania',
      email: 'c@b.com',
      birthDate: DateTime.now(),
      phone: 123456789,
      );

  List<User> get users => _users;
  User? get selectedUser => _selectedUser;

  UserSaveStatus _saveStatus = UserSaveStatus.success;
  UserSaveStatus get saveStatus => _saveStatus;

  set saveStatus(UserSaveStatus status) {
    _saveStatus = status;
    notifyListeners();
  }

  void selectUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }

  Future<void> saveUser(User user) async {
    try {
      // Obtener la lista de usuarios existentes
      final existingUsers = await getUsers();

      // Verificar si el usuario ya existe en la lista
      final isUserExists =
          existingUsers.any((existingUser) => existingUser.id == user.id);

      if (!isUserExists) {
        _saveStatus = UserSaveStatus.success;
        await saveUserUseCase(user);
        _users.add(user);
        notifyListeners();
      } else {
        _saveStatus = UserSaveStatus.userExists;
        // await createHistoryRecord(user.id, // ... otros datos del historial);
        notifyListeners();
      }
    } catch (error) {
      print('Error al guardar el usuario: $error');
    }
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

  Future<List<User>> getUsers() async {
    final users = await getUsersUseCase();
    _users.clear();
    _users.addAll(users);
    notifyListeners();
    return _users;
  }
}

enum UserSaveStatus { success, error, userExists }
