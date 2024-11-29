import 'package:agenda_clinica/models/user.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  final List<User> users;

  const UserDetailsPage({super.key, required this.users});

  @override
  State<UserDetailsPage> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetailsPage> {
  TextEditingController editingController = TextEditingController();

  List<User> itemsSearch = [];

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        itemsSearch = widget.users;
      });
    } else {
      setState(() {
        itemsSearch = widget.users
            .where(
                (user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        print(itemsSearch);
        print(query);
      });
    }
  }

  @override
  void initState() {
    itemsSearch = widget.users;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('atras')),
        ],
      ),
      backgroundColor: Colors.pink.shade50,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
            const SizedBox(height:30),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Nombre',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VerticalDivider(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      'N° Documento de identidad',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VerticalDivider(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      'Teléfono',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VerticalDivider(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      'Correo',
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
                  return Container(
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
