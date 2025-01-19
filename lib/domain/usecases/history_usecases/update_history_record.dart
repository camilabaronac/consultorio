
import 'package:agenda_clinica/domain/gateway/history_gateway.dart';
import 'package:agenda_clinica/domain/models/history.dart';

class UpdateHistoryRecord {
  final HistoryGateway repository;

  UpdateHistoryRecord(this.repository);

  Future<void> call(History history) async {
    return await repository.updateHistoryRecord(history);
  }
}