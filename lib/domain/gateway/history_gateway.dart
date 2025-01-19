
import 'package:agenda_clinica/domain/models/history.dart';

abstract class HistoryGateway {
  Future<void> createHistoryRecord(History history);
  Future<void> getHistoryRecordsByUser(String userId);
  Future<void> updateHistoryRecord(History history);
  Future<void> deleteHistoryRecord(String historyId);
}
