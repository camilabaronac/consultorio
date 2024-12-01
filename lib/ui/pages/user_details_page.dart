import 'dart:math';

import 'package:agenda_clinica/ui/providers/user_provider.dart';
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
        // appBar: AppBar(
        //   actions: [
        //     // ElevatedButton(
        //     //     onPressed: () => Navigator.popAndPushNamed(context, RoutesName.listUser),
        //     //     child: const Text('atras')),
        //   ],

        // ),
        backgroundColor: Colors.pink.shade50,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [...colors],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset('assets/images/avatar$currentAvatar.png',
                    width: 200),
                SizedBox(width: 30),
                Text(user.name)
              ],
            ),
          ),
        ));
  }
}
