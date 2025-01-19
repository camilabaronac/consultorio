import 'package:agenda_clinica/domain/models/history.dart';

//El data source es responsable de interactuar con la base de datos, API u otro servicio de almacenamiento
class HistoryLocalDataSource {
  final List<History> _history = [];

  Future<void> createHistoryRecord(History history) async {
    _history.add(history);
  }

  Future<void> updateHistoryRecord(History user) async {
    final index = _history.indexWhere((u) => u.id == user.id);
    if (index != -1) _history[index] = user;
  }

  Future<void> deleteHistoryRecord(String userId) async {
    _history.removeWhere((user) => user.id == userId);
  }

  Future<List<History>> getHistoryRecord() async {
    return _history;
  }

  Future<History?> getHistoryRecordById(String userId) async {
    final model = _history.firstWhere((user) => user.id == userId);
    return model; 
  }

}
