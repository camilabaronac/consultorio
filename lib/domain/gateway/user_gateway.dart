import 'package:agenda_clinica/domain/models/user.dart';

abstract class UserRepository {
  Future<void> saveUser(User user);
  Future<void> editUser(User user);
  Future<void> deleteUser(int userId);
  Future<List<User>> getUsers();
}
