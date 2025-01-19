import 'package:agenda_clinica/domain/models/user.dart';

class History {
  final String id;
  final String userId;
  final DateTime registerDate;
  final String consult;
  final String record;
  final String diagnosis;

  History({
    required this.id,
    required this.userId,
    required this.consult,
    required this.record,
    required this.diagnosis,
    required this.registerDate,
  });

    String get formattedRegisterDate => '${registerDate.day}/${registerDate.month}/${registerDate.year}';

}
