import 'package:agenda_clinica/domain/gateway/user_gateway.dart';
import 'package:agenda_clinica/domain/models/user.dart';

class EditUser {
  final UserGateway repository;

  EditUser(this.repository);

  Future<void> call(User user) async {
    return await repository.editUser(user);
  }
}
