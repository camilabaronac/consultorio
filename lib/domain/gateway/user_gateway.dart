import 'package:agenda_clinica/domain/models/user.dart';

abstract class UserGateway {
  Future<void> saveUser(User user);
  Future<void> editUser(User user);
  Future<void> deleteUser(String userId);
  Future<List<User>> getUsers();
}
