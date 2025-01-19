import 'package:agenda_clinica/data/models/user_model.dart';

//El data source es responsable de interactuar con la base de datos, API u otro servicio de almacenamiento
class UserLocalDataSource {
  final List<UserModel> _users = [];

  Future<void> saveUser(UserModel user) async {
    _users.add(user);
  }

  Future<void> editUser(UserModel user) async {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) _users[index] = user;
  }

  Future<void> deleteUser(String userId) async {
    _users.removeWhere((user) => user.id == userId);
  }

  Future<List<UserModel>> getUsers() async {
    return _users;
  }

}
