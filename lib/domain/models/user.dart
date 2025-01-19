class User {
  final String name;
  final String id;
  final int age;
  final String idType;
  final String email;
  final DateTime birthDate;
  final int phone;

  User({
    required this.name,
    required this.age,
    required this.id,
    required this.idType,
    required this.email,
    required this.birthDate,
    required this.phone,
  });

    String get formattedDate => '${birthDate.day}/${birthDate.month}/${birthDate.year}';

}
