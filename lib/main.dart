import 'package:agenda_clinica/data/datasources/user_local_data_source.dart';
import 'package:agenda_clinica/data/gateway_implementation/gateway_implementation.dart';
import 'package:agenda_clinica/config/navigation/routes.dart';
import 'package:agenda_clinica/domain/usecases/delete_user.dart';
import 'package:agenda_clinica/domain/usecases/edit_user.dart';
import 'package:agenda_clinica/domain/usecases/get_users.dart';
import 'package:agenda_clinica/domain/usecases/save_user.dart';
import 'package:agenda_clinica/ui/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final userLocalDataSource = UserLocalDataSource();
  final userRepository = UserGatewayImpl(userLocalDataSource);

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(
        saveUserUseCase: SaveUser(userRepository),
        editUserUseCase: EditUser(userRepository),
        deleteUserUseCase: DeleteUser(userRepository),
        getUsersUseCase: GetUsers(userRepository),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 241, 151, 232)),
        useMaterial3: true,
      ),
      // initialRoute: RoutesName.add,
      onGenerateRoute: AppRoutes.generateRoute,
      // home: HomePage(),
      // home: const UserDetailsPage(),
      // home:  UserListPage(users: [user,user2,user3,user,user2,user3,user,user3,user2,user2,user2,user,user3,user,user2,user3,user,user],),
    );
  }
}
