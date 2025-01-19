import 'package:agenda_clinica/data/datasources/history_local_data_source.dart';
import 'package:agenda_clinica/data/datasources/user_local_data_source.dart';
import 'package:agenda_clinica/data/gateway_implementation/gateway_implementation.dart';
import 'package:agenda_clinica/config/navigation/routes.dart';
import 'package:agenda_clinica/data/gateway_implementation/history_gateway.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/create_history_record.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/delete_history_record.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/get_history_records_by_user.dart';
import 'package:agenda_clinica/domain/usecases/history_usecases/update_history_record.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/delete_user.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/edit_user.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/get_users.dart';
import 'package:agenda_clinica/domain/usecases/user_usecases/save_user.dart';
import 'package:agenda_clinica/ui/providers/history_provider.dart';
import 'package:agenda_clinica/ui/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final userLocalDataSource = UserLocalDataSource();
  final userRepository = UserGatewayImpl(userLocalDataSource);

    final historyLocalDataSource = HistoryLocalDataSource();
  final historyRepository = HistoryGatewayImpl(historyLocalDataSource);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(
          saveUserUseCase: SaveUser(userRepository),
          editUserUseCase: EditUser(userRepository),
          deleteUserUseCase: DeleteUser(userRepository),
          getUsersUseCase: GetUsers(userRepository),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => HistoryProvider(
          createHistoryRecordUsecase: CreateHistoryRecord(historyRepository),
          deleteHistoryRecordUsecase: DeleteHistoryRecord(historyRepository),
          getHistoryRecordUsecase: GetHistoryRecord(historyRepository),
          updateHistoryRecordUsecase: UpdateHistoryRecord(historyRepository),
        ),
      )
    ],
    child: MyApp(),
  ));
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
