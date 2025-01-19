import 'package:agenda_clinica/data/datasources/history_local_data_source.dart';
import 'package:agenda_clinica/data/datasources/user_local_data_source.dart';
import 'package:agenda_clinica/data/models/history_model.dart';
import 'package:agenda_clinica/domain/gateway/history_gateway.dart';
import 'package:agenda_clinica/domain/models/history.dart';
import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/data/models/user_model.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/create_history_record.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/get_history_records_by_user.dart';

class HistoryGatewayImpl implements HistoryGateway {
  final HistoryLocalDataSource dataSource;

  HistoryGatewayImpl(this.dataSource);

  @override
  Future<void> createHistoryRecord(History history) async {
    await dataSource.createHistoryRecord(HistoryModel(
      id: history.id,
      userId: history.userId,
      diagnosis: history.diagnosis,
      consult: history.consult,
      record: history.record,
      registerDate: history.registerDate,
    ));
  }

  @override
  Future<void> updateHistoryRecord(History history) async {
    await dataSource.updateHistoryRecord(HistoryModel(
      id: history.id,
      userId: history.userId,
      diagnosis: history.diagnosis,
      consult: history.consult,
      record: history.record,
      registerDate: history.registerDate,
    ));
  }

  @override
  Future<void> deleteHistoryRecord(String historyId) async {
    await dataSource.deleteHistoryRecord(historyId);
  }

  @override
  Future<List<History>> getHistoryRecord() async {
    final models = await dataSource.getHistoryRecord();
    return models
        .map((model) => History(
              id: model.id,
              userId: model.userId,
              diagnosis: model.diagnosis,
              consult: model.consult,
              record: model.record,
              registerDate: model.registerDate,
            ))
        .toList();
  }
  
  @override
  Future<void> getHistoryRecordsByUser(String userId) {
    // TODO: implement getHistoryRecordsByUser
    throw UnimplementedError();
  }

  
}
