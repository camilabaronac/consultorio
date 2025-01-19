import 'package:agenda_clinica/data/datasources/user_local_data_source.dart';
import 'package:agenda_clinica/domain/gateway/user_gateway.dart';
import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/data/models/user_model.dart';

class UserGatewayImpl implements UserGateway {
  final UserLocalDataSource dataSource;

  UserGatewayImpl(this.dataSource);

  @override
  Future<void> saveUser(User user) async {
    await dataSource.saveUser(UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        age: user.age,
        registerDate: user.registerDate,
        idType: user.idType,
        birthDate: user.birthDate,
        consult: user.consult,
        record: user.record,
        diagnosis: user.diagnosis));
  }

  @override
  Future<void> editUser(User user) async {
    await dataSource.editUser(UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        age: user.age,
        idType: user.idType,
        registerDate: user.registerDate,
        birthDate: user.birthDate,
        consult: user.consult,
        record: user.record,
        diagnosis: user.diagnosis));
  }

  @override
  Future<void> deleteUser(String userId) async {
    await dataSource.deleteUser(userId);
  }

  @override
  Future<List<User>> getUsers() async {
    final models = await dataSource.getUsers();
    return models
        .map((model) => User(
            id: model.id,
            name: model.name,
            email: model.email,
            phone: model.phone,
            age: model.age,
            idType: model.idType,
            birthDate: model.birthDate,
            consult: model.consult,
            record: model.record,
            registerDate: model.registerDate,
            diagnosis: model.diagnosis))
        .toList();
  }
  
  @override
  Future<User?> getUserById(String userId) async {
    final model = await dataSource.getUserById(userId);
    if (model == null) return null;
    return User(
        id: model.id,
        name: model.name,
        email: model.email,
        phone: model.phone,
        age: model.age,
        idType: model.idType,
        birthDate: model.birthDate,
        consult: model.consult,
        record: model.record,
        registerDate: model.registerDate,
        diagnosis: model.diagnosis);
  }
}
