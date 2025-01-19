import 'dart:math';

import 'package:agenda_clinica/ui/providers/user_provider.dart';
import 'package:agenda_clinica/ui/widgets/user_details/user_details_card.dart';
import 'package:agenda_clinica/ui/widgets/user_details/user_details_consult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final random = Random();
  var currentAvatar = 2;

  final textStyleBold =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  final textStyleNormal = const TextStyle(
    fontSize: 18,
  );

  final List<Color> colors = [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 255, 254, 254)
  ];

  @override
  void initState() {
    super.initState();
    currentAvatar = random.nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.selectedUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('No se seleccionó ningún usuario')),
      );
    }

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: UserDetailsCard(
                  user: user,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: UserDetailsConsult(user: user),
              )
            ],
          ),
        ));
  }
}
