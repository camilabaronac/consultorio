import 'package:agenda_clinica/domain/models/history.dart';
import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/create_history_record.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/delete_history_record.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/get_history_records_by_user.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/update_history_record.dart';
import 'package:flutter/material.dart';

class HistoryProvider extends ChangeNotifier {
  final CreateHistoryRecord createHistoryRecordUsecase;
  final DeleteHistoryRecord deleteHistoryRecordUsecase;
  final GetHistoryRecord getHistoryRecordUsecase;
  final UpdateHistoryRecord updateHistoryRecordUsecase;

  HistoryProvider({
    required this.createHistoryRecordUsecase,
    required this.deleteHistoryRecordUsecase,
    required this.getHistoryRecordUsecase,
    required this.updateHistoryRecordUsecase,
  });

  final List<History> _histories = [];

  History? _historySelected;

  List<History> get histories => _histories;
  History? get selectedHistory => _historySelected;

  void selectHistory(User user) {
    try {
      _historySelected = _histories.firstWhere(
        (history) => history.userId == user.id,
      );
      notifyListeners();
    } catch (error) {
      print('Error al guardar el usuario: $error');
    }

    notifyListeners();
  }

  Future<void> deleteHistoryRecord(String userId) async {
    try {
      await deleteHistoryRecordUsecase(userId);
      _histories.removeWhere((history) => history.userId == userId);
      notifyListeners();
    } catch (error) {
      // Maneja el error
      print('error en delete history record');
    }
  }

  Future<void> createHistoryRecord(History history) async {
    print('createHistoryRecord $history');
    try {
      await createHistoryRecordUsecase(history);
      _histories.add(history);
      notifyListeners();
    } catch (error) {
      print('Error al guardar el usuario: $error');
    }
  }
}
