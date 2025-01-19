import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/ui/pages/user_list_page.dart';
import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:agenda_clinica/ui/providers/user_provider.dart';
import 'package:agenda_clinica/ui/widgets/personal_information.dart';
import 'package:agenda_clinica/ui/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPacientPage extends StatefulWidget {
  const AddPacientPage({super.key});

  @override
  State<AddPacientPage> createState() => _AddPacientPageState();
}

class _AddPacientPageState extends State<AddPacientPage> {
  final _formAddKey = GlobalKey<FormState>();

  //Controladores de texto
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final consultController = TextEditingController();
  final recordController = TextEditingController();
  final diagnosisController = TextEditingController();

  DateTime? selectedBirthDate;
  String? selectedDocument = "Cédula de ciudadanía";

  // Lista para almacenar usuarios registrados
  late UserProvider userProvider;


  //Método para actualizar la información de la fecha de nacimiento que viene desde personal information
  void _updateBirthDate(DateTime birthDate) {
    setState(() {
      selectedBirthDate = birthDate;
    });
  }

  //Método para actualizar la información del tipo de documento que viene desde personal information
  void _updateDocumentType(String document) {
    setState(() {
      selectedDocument = document;
    });
  }

  //Método para registrar un usuario
  void _saveUser() {
    if (_formAddKey.currentState!.validate()) {
      DateTime now = DateTime.now();
      setState(() {
        userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.saveUser(
          User(
            name: nameController.text,
            registerDate: now,
            age: int.parse(ageController.text),
            id: idController.text,
            email: emailController.text,
            idType: selectedDocument!,
            birthDate: selectedBirthDate!,
            phone: int.parse(phoneController.text),
            consult: consultController.text,
            record: recordController.text,
            diagnosis: diagnosisController.text,
          ),
          // User(name: 'Camila', age: 24, id: '1010136709', idType: 'Cédula de Ciudadania', email: 'c@b.com', birthDate: DateTime.now(), phone: 3123452342, consult: 'Motivo de consulta', record: 'Antecedentes', diagnosis: 'Diagnostico')
        );
      });

      showAlertDialog(context, nameController.text, userProvider);

      // Limpia los campos después de agregar
      nameController.clear();
      emailController.clear();
      idController.clear();
      phoneController.clear();
      ageController.clear();
      consultController.clear();
      recordController.clear();
      diagnosisController.clear();
    }
  }

  showAlertDialog(BuildContext context, String name, UserProvider user) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Aceptar"),
      onPressed: () {
        // Cerrar el diálogo de alerta antes de navegar
        Navigator.pop(context);

        // Navegar a la página de detalles del usuario
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserListPage(),
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(addPacient['alertTitle']!),
      content: Text(
          'La paciente $name ha sido registrada en nuestra base de datos.'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 252, 194, 194),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        title: Text(
          addPacient['clinicHistory']!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formAddKey,
                child: Column(
                  children: [
                    PersonalInformation(
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      ageController: ageController,
                      idController: idController,
                      onBirthDateSelected: _updateBirthDate,
                      onDocumentSelected: _updateDocumentType,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextForm(
                        controller: consultController, text: addPacient['consult']!, isLarge: true ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextForm(
                        controller: recordController, text: addPacient['record']!, isLarge: true,),
                    const SizedBox(
                      height: 30,
                    ),
                    TextForm(
                        controller: diagnosisController, text: addPacient['diagnosis']!, isLarge: true,),
                    Container(
                      margin: const EdgeInsets.only(top: 32, bottom: 48),
                      width: 394,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _saveUser();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        backgroundColor: const Color.fromARGB(255, 252, 194, 194),
                        ),
                        child: Text(save, style: const TextStyle(color:Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
