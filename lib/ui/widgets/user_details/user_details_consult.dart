import 'package:agenda_clinica/domain/models/user.dart';
import 'package:flutter/material.dart';

class UserDetailsConsult extends StatefulWidget {
  const UserDetailsConsult({super.key, required this.user});

  final User user;

  @override
  State<UserDetailsConsult> createState() => _UserDetailsConsultState();
}

class _UserDetailsConsultState extends State<UserDetailsConsult> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            width: 400,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          decoration:  BoxDecoration(
                            color: Colors.pink.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(Icons.medical_services),
                                const SizedBox(width: 10),
                                const Text('Consulta médica',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Text(widget.user.formattedRegisterDate.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Mótivo de consulta',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Divider(),
                        const SizedBox(height: 10),
                        Text(widget.user.consult,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                        const SizedBox(height: 20),
  
                        Text(widget.user.consult,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                        const SizedBox(height: 20),
                        const Text('Antecedentes',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Divider(),
                        const SizedBox(height: 10),
                        Text(widget.user.record,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                        const SizedBox(height: 20),
                        const Text('Diagnostico',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Divider(),
                        const SizedBox(height: 10),
                        Text(widget.user.diagnosis,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// const SizedBox(height: 10),
//                   const Text(
//                     'Consultar datos del usuario',
//                     style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Ingrese el número de identificación del usuario',
//                     style: TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.normal),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Número de identificación',
//                     ),
//                   ),