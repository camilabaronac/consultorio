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

  late final List<History> _histories = List.generate(
    10,
    (index) => History(
      id: '123456789',
      userId: '123456789',
      registerDate: DateTime.now(),
      consult:
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."',
      diagnosis:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      record:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
  );

  List<History> get histories => _histories;
  History? get selectedHistory => _histories.first;

  void selectHistory(History history) {
    _histories.first = history;
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
    try {
      await createHistoryRecordUsecase(history);
      _histories.add(history);
      notifyListeners();
    } catch (error) {
      print('Error al guardar el usuario: $error');
    }
  }
}
