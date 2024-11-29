import 'package:agenda_clinica/models/user.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  final User user;

  const UserDetailsPage({super.key, required this.user});

  @override
  State<UserDetailsPage> createState() => _UserDetailsState();
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class _UserDetailsState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          },
        ));
  }
}
