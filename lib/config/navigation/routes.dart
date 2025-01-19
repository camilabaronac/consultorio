import 'package:agenda_clinica/ui/pages/add_pacient_page.dart';
import 'package:agenda_clinica/ui/pages/home.dart';
import 'package:agenda_clinica/ui/pages/intro_page.dart';
import 'package:agenda_clinica/ui/pages/user_details_page.dart';
import 'package:agenda_clinica/ui/pages/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:agenda_clinica/config/navigation/routes_name.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.add:
        return MaterialPageRoute(builder: (context) => const AddPacientPage());
      case RoutesName.user:
        return MaterialPageRoute(
            builder: (context) => const UserDetailsPage());
      case RoutesName.listUser:
        return MaterialPageRoute(
            builder: (context) => const UserListPage());
      case RoutesName.intro:
        return MaterialPageRoute(
            builder: (context) => const IntroPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
