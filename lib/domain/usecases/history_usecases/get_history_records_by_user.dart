
import 'package:agenda_clinica/domain/gateway/history_gateway.dart';

class GetHistoryRecord {
  final HistoryGateway repository;

  GetHistoryRecord(this.repository);

  Future<void> call(String userId) async {
    return await repository.getHistoryRecordsByUser(userId);
  }
}