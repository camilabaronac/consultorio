import 'package:agenda_clinica/navigation/routes.dart';
import 'package:agenda_clinica/navigation/routes_name.dart';
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
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 241, 151, 232)),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.add,
      onGenerateRoute: AppRoutes.generateRoute,
      home: const HomePage(),
    );
  }
}



