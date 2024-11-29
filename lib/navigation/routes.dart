import 'package:agenda_clinica/pages/add_pacient_page.dart';
import 'package:agenda_clinica/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:agenda_clinica/navigation/routes_name.dart';

class AppRoutes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.add:
        return MaterialPageRoute(builder: (context) => const AddPacientPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
