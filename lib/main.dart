import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/config/navigation/routes.dart';
import 'package:agenda_clinica/ui/pages/home.dart';
import 'package:agenda_clinica/ui/pages/user_details_page.dart';
import 'package:agenda_clinica/ui/pages/user_list_page.dart';
import 'package:agenda_clinica/config/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User user = User(
      registerDate: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
      
      name: 'Camila',
      age: 14,
      id: '12345678',
      idType: 'Cédula de ciudadanía',
      email: 'c@b.com',
      birthDate: DateTime(200, 1, 10),
      phone: 12345678,
      consult: 'asdfghjk',
      record: 'sdfghj',
      diagnosis: 'dfghj',
    );

    User user2 = User(
      registerDate: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
      
      name: 'Mariana',
      age: 14,
      id: '12345678',
      idType: 'Cédula de ciudadanía',
      email: 'c@b.com',
      birthDate: DateTime(200, 1, 10),
      phone: 12345678,
      consult: 'asdfghjk',
      record: 'sdfghj',
      diagnosis: 'dfghj',
    );

    User user3 = User(
      registerDate: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
      name: 'Jose',
      age: 14,
      id: '12345678',
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
      // home: UserDetailsPage(user: user),
      // home:  UserListPage(users: [user,user2,user3,user,user2,user3,user,user3,user2,user2,user2,user,user3,user,user2,user3,user,user],),
    );
  }
}
