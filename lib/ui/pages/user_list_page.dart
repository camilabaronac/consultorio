import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/config/navigation/routes_name.dart';
import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:agenda_clinica/ui/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserListPage> {
  TextEditingController editingController = TextEditingController();

  List<User> itemsSearch = [];

  void filterSearchResults(String query, List<User> users) {
    if (query.isEmpty) {
      setState(() {
        itemsSearch = users;
      });
    } else {
      setState(() {
        itemsSearch = users.where((user) {
          final lowerCaseQuery = query.toLowerCase();
          return user.name.toLowerCase().contains(lowerCaseQuery) ||
              user.id.toString().contains(lowerCaseQuery);
        }).toList();
      });
    }
  }

  @override
  void initState() {
    // La lista inicial se llenará cuando se construya por primera vez
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final users = context.read<UserProvider>().users;
      setState(() {
        itemsSearch = users;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>(); // Escuchar cambios
    final users = userProvider.users;

    if (users.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('atras')),
          ],
        ),
        backgroundColor: Colors.pink.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No hay pacientes registradas', style: TextStyle(fontSize: 30),),
              const SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, RoutesName.add);
              }, child: const Text('Registrar paciente'))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          // actions: [
          //   ElevatedButton(
          //       onPressed: () => Navigator.pop(context),
          //       child: const Text('atras')),
          // ],
        ),
        backgroundColor: Colors.pink.shade50,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  filterSearchResults(value, users);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: search,
                    hintText: search,
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        userList['registerDate']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const VerticalDivider(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        userList['name']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const VerticalDivider(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        userList['documentNumber']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const VerticalDivider(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        userList['phone']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const VerticalDivider(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        userList['email']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  itemCount: itemsSearch.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final user = itemsSearch[index];
                    return GestureDetector(
                      onTap: () {
                        final user = itemsSearch[index];
                        Provider.of<UserProvider>(context, listen: false)
                            .selectUser(user);

                        Navigator.of(context).pushNamed(RoutesName.user);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                user.registerDate.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const VerticalDivider(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                user.name,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const VerticalDivider(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                user.id.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const VerticalDivider(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                user.phone.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const VerticalDivider(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                user.email,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
