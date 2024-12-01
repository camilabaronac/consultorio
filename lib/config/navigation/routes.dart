import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/ui/pages/add_pacient_page.dart';
import 'package:agenda_clinica/ui/pages/home.dart';
import 'package:agenda_clinica/ui/pages/user_details_page.dart';
import 'package:agenda_clinica/ui/pages/user_list_page.dart';
import 'package:agenda_clinica/ui/providers/user_provider.dart';
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
            builder: (context) => UserDetailsPage());
      case RoutesName.listUser:
        return MaterialPageRoute(
            builder: (context) => const UserListPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
