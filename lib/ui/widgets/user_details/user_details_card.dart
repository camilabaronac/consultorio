import 'dart:math';

import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/ui/widgets/user_details/user_details_list.dart';
import 'package:flutter/material.dart';

class UserDetailsCard extends StatefulWidget {
  const UserDetailsCard({super.key, required this.user});

  final User user;

  @override
  State<UserDetailsCard> createState() => _UserDetailsCardState();
}

class _UserDetailsCardState extends State<UserDetailsCard> {
  final random = Random();
  var currentAvatar = 1;

  @override
  void initState() {
    super.initState();
    currentAvatar = random.nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/avatar$currentAvatar.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.user.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
             
                    Row(
                      children: [
                         Text('${widget.user.idType} :',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                       '${widget.user.id}',
                      style: const TextStyle(fontSize: 16),
                    ),
                      ],
                    ),
                    const Spacer(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('Fecha de nacimiento: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          widget.user.formattedDate,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [

                    Row(
                      children: [
                        const Text('Correo: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          widget.user.email,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Text('Teléfono: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          widget.user.phone.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                      children: [
                        const Text('Edad: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          widget.user.age.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
            
                const SizedBox(height: 10),
                const Text(
                  'Historias Clínicas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const Expanded(
              child: UserDetailsList(),
            ),
          ],
        ),
      ),
    );
  }
}
