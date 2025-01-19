
import 'package:agenda_clinica/domain/gateway/history_gateway.dart';

class DeleteHistoryRecord {
  final HistoryGateway repository;

  DeleteHistoryRecord(this.repository);

  Future<void> call(String historyId) async {
    return await repository.deleteHistoryRecord(historyId);
  }
}