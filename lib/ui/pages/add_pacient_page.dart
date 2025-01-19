import 'package:agenda_clinica/domain/models/history.dart';
import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/ui/pages/user_list_page.dart';
import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:agenda_clinica/ui/providers/history_provider.dart';
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
  late HistoryProvider historyProvider;

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
  Future<void> _saveUser() async {
    DateTime now = DateTime.now();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    historyProvider = Provider.of<HistoryProvider>(context, listen: false);

    // Check for existing user before saving
    if (_formAddKey.currentState!.validate()) {
      DateTime now = DateTime.now();
      setState(() {
        userProvider = Provider.of<UserProvider>(context, listen: false);
        historyProvider = Provider.of<HistoryProvider>(context, listen: false);
        userProvider.saveUser(
          User(
            name: nameController.text,
            age: int.parse(ageController.text),
            id: idController.text,
            email: emailController.text,
            idType: selectedDocument!,
            birthDate: selectedBirthDate!,
            phone: int.parse(phoneController.text),
          ),
        );
        historyProvider.createHistoryRecord(
          History(
            id: '${idController.text}-id',
            userId: idController.text,
            consult: consultController.text,
            record: recordController.text,
            diagnosis: diagnosisController.text,
            registerDate: now,
          ),
        );
      });

      showAlertDialog(context, nameController.text, userProvider);

      // Limpia los campos después de agregar
    }
  }

  void cleanForm() {
    nameController.clear();
    emailController.clear();
    idController.clear();
    phoneController.clear();
    ageController.clear();
    consultController.clear();
    recordController.clear();
    diagnosisController.clear();
  }

  void showAlertDialog(BuildContext context, String name, UserProvider user) {
    // set up the AlertDialogs
    AlertDialog successAlert = AlertDialog(
      title: Text(addPacient['alertTitle']!),
      content: Text(
          'La paciente $name ha sido registrada en nuestra base de datos.'),
      actions: [
        TextButton(
          child: const Text("Aceptar"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserListPage(),
              ),
            );
            cleanForm();
          },
        )
      ],
    );

    AlertDialog userExistsAlert = AlertDialog(
      title: Text(pacientExists['alertTitle']!),
      content: Text(pacientExists['alertContent']!),
      actions: [
        TextButton(
          child: Text(pacientExists['yes']!),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserListPage(),
              ),
            );
            cleanForm();
          },
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(pacientExists['no']!)),
      ],
    );

    // show the dialog based on userProvider.saveStatus
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (user.saveStatus == UserSaveStatus.success) {
          return successAlert;
        } else if (user.saveStatus == UserSaveStatus.userExists) {
          return userExistsAlert;
        } else {
          // Handle other potential errors (optional)
          return const Text('Unexpected error!');
        }
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
                        controller: consultController,
                        text: addPacient['consult']!,
                        isLarge: true),
                    const SizedBox(
                      height: 30,
                    ),
                    TextForm(
                      controller: recordController,
                      text: addPacient['record']!,
                      isLarge: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextForm(
                      controller: diagnosisController,
                      text: addPacient['diagnosis']!,
                      isLarge: true,
                    ),
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
                          backgroundColor:
                              const Color.fromARGB(255, 252, 194, 194),
                        ),
                        child: Text(
                          save,
                          style: const TextStyle(color: Colors.black),
                        ),
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
