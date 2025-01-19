import 'package:agenda_clinica/domain/models/history.dart';

//El modelo extiende la entidad e incluye métodos para mapear datos entre la capa de datos y dominio:
class HistoryModel extends History {
  HistoryModel(
      {required super.id,
      required super.consult,
      required super.record,
      required super.diagnosis,
      required super.registerDate,
      required super.userId});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      consult: json['consult'],
      record: json['record'],
      diagnosis: json['diagnosis'],
      registerDate: json['registerDate'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'consult': consult,
      'record': record,
      'diagnosis': diagnosis,
      'registerDate': registerDate,
      'userId': userId,
    };
  }
}
