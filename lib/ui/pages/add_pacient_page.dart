import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/ui/pages/user_list_page.dart';
import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:agenda_clinica/config/providers/user_provider.dart';
import 'package:agenda_clinica/ui/widgets/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(now);
      setState(() {
        userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.addUser(
          User(
            name: nameController.text,
            registerDate: formattedDate,
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

  Widget textFormLarge(controller, textInput, context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value) => value!.isEmpty ? textForm : null,
          controller: controller,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: InputDecoration(
            border: InputBorder.none,
            label: Text(
              textInput,
              softWrap: true,
              style: const TextStyle(
                color: Color.fromARGB(255, 185, 183, 183),
              ),
            ),
          ),
        ),
      ),
    );
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
            builder: (context) => UserListPage(),
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
        backgroundColor: Colors.pink.shade50,
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
                    textFormLarge(
                        consultController, addPacient['consult'], context),
                    const SizedBox(
                      height: 30,
                    ),
                    textFormLarge(
                        recordController, addPacient['record'], context),
                    const SizedBox(
                      height: 30,
                    ),
                    textFormLarge(
                        diagnosisController, addPacient['diagnosis'], context),
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
                        ),
                        child: Text(save),
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
