
import 'package:agenda_clinica/domain/gateway/history_gateway.dart';
import 'package:agenda_clinica/domain/models/history.dart';

class CreateHistoryRecord {
  final HistoryGateway repository;

  CreateHistoryRecord(this.repository);

  Future<void> call(History history) async {
    return await repository.createHistoryRecord(history);
  }
}