import 'package:agenda_clinica/domain/models/user.dart';


//El modelo extiende la entidad e incluye métodos para mapear datos entre la capa de datos y dominio:
class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.age,
    required super.idType,
    required super.birthDate,
    required super.consult,
    required super.record,
    required super.diagnosis,
    required super.registerDate
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      age: json['age'],
      idType: json['idType'],
      birthDate: json['birthDate'],
      consult: json['consult'],
      record: json['record'],
      diagnosis: json['diagnosis'],
      registerDate: json['registerDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
      'idType': idType,
      'birthDate': birthDate,
      'consult': consult,
      'record': record,
      'diagnosis': diagnosis,
      'registerDate': registerDate,
    };
  }
}
