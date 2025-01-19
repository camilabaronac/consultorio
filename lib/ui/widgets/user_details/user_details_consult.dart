import 'package:agenda_clinica/domain/models/user.dart';
import 'package:flutter/material.dart';

class UserDetailsConsult extends StatefulWidget {
  const UserDetailsConsult({super.key, required this.user});

  final User user;

  @override
  State<UserDetailsConsult> createState() => _UserDetailsConsultState();
}

class _UserDetailsConsultState extends State<UserDetailsConsult> {
  TextStyle textStyleBold =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  TextStyle textStyleNormal =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consulta médica',
          style: textStyleBold,
        ),
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          0,
        ),
        backgroundColor: Colors.pink.shade50,
      ),
      body: CustomScrollView(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Fecha de registro: ', style: textStyleBold),
                              Text(widget.user.formattedRegisterDate, style: textStyleNormal),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(Icons.medical_services),
                              const SizedBox(width: 10),
                              Text('Mótivo de consulta', style: textStyleBold),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 10),
                          Text(widget.user.consult, style: textStyleNormal),
                          const SizedBox(height: 20),
                          Text(widget.user.consult, style: textStyleNormal),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(Icons.medical_services),
                              const SizedBox(width: 10),
                              Text('Antecedentes', style: textStyleBold),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 10),
                          Text(widget.user.record, style: textStyleNormal),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(Icons.medical_services),
                              const SizedBox(width: 10),
                              Text('Diagnostico', style: textStyleBold),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 10),
                          Text(widget.user.diagnosis, style: textStyleNormal),
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
      ),
    );
  }
}
