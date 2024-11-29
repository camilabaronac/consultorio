import 'package:agenda_clinica/models/user.dart';
import 'package:agenda_clinica/navigation/routes.dart';
import 'package:agenda_clinica/navigation/routes_name.dart';
import 'package:agenda_clinica/pages/user_details_page.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User user = User(
      name: 'Camila',
      age: 14,
      id: 12345678,
      idType: 'Cédula de ciudadanía',
      email: 'c@b.com',
      birthDate: DateTime(200, 1, 10),
      phone: 12345678,
      consult: 'asdfghjk',
      record: 'sdfghj',
      diagnosis: 'dfghj',
    );

    User user2 = User(
      name: 'Mariana',
      age: 14,
      id: 12345678,
      idType: 'Cédula de ciudadanía',
      email: 'c@b.com',
      birthDate: DateTime(200, 1, 10),
      phone: 12345678,
      consult: 'asdfghjk',
      record: 'sdfghj',
      diagnosis: 'dfghj',
    );

    User user3 = User(
      name: 'Jose',
      age: 14,
      id: 12345678,
      idType: 'Cédula de ciudadanía',
      email: 'c@b.com',
      birthDate: DateTime(200, 1, 10),
      phone: 12345678,
      consult: 'asdfghjk',
      record: 'sdfghj',
      diagnosis: 'dfghj',
    );


    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 241, 151, 232)),
        useMaterial3: true,
      ),
      // initialRoute: RoutesName.add,
      onGenerateRoute: AppRoutes.generateRoute,
      home: HomePage(),
      // home:  UserDetailsPage(users: [user,user2,user3,user,user2,user3,user,user3,user2,user2,user2,user,user3,user,user2,user3,user,user],),
    );
  }
}
