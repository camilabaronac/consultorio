import 'dart:math';

import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/config/navigation/routes_name.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  final User user;

  const UserDetailsPage({super.key, required this.user});

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
    // TODO: implement initState
    super.initState();
    currentAvatar = random.nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
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
                Text(widget.user.name)
              ],
            ),
          ),
        ));
  }
}
