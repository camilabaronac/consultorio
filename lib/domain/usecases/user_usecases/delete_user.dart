import 'package:agenda_clinica/domain/gateway/user_gateway.dart';

class DeleteUser {
  final UserGateway repository;

  DeleteUser(this.repository);

  Future<void> call(String userId) async {
    return await repository.deleteUser(userId);
  }
}
