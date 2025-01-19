import 'package:agenda_clinica/domain/gateway/user_gateway.dart';
import 'package:agenda_clinica/domain/models/user.dart';

class GetUsers {
  final UserGateway repository;

  GetUsers(this.repository);

  Future<List<User>> call() async {
    return await repository.getUsers();
  }
}
