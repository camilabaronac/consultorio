class User {
  final String name;
  final String id;
  final DateTime registerDate;
  final int age;
  final String idType;
  final String email;
  final DateTime birthDate;
  final int phone;
  final String consult;
  final String record;
  final String diagnosis;

  User({
    required this.name,
    required this.age,
    required this.id,
    required this.idType,
    required this.email,
    required this.birthDate,
    required this.phone,
    required this.consult,
    required this.record,
    required this.diagnosis,
    required this.registerDate,
  });

    String get formattedDate => '${birthDate.day}/${birthDate.month}/${birthDate.year}';
    String get formattedRegisterDate => '${registerDate.day}/${birthDate.month}/${birthDate.year}';

}
