import 'package:agenda_clinica/models/user.dart';
import 'package:agenda_clinica/pages/user_details_page.dart';
import 'package:agenda_clinica/widgets/personal_information.dart';
import 'package:flutter/material.dart';

class AddPacientPage extends StatefulWidget {
  const AddPacientPage({super.key});

  @override
  State<AddPacientPage> createState() => _AddPacientPageState();
}

class _AddPacientPageState extends State<AddPacientPage> {
  final _formAddKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final consultController = TextEditingController();
  final recordController = TextEditingController();
  final diagnosisController = TextEditingController();

  DateTime? selectedBirthDate;
  String? selectedDocument = "Cédula de ciudadanía"; // Valor inicial

  void _updateBirthDate(DateTime birthDate) {
    setState(() {
      selectedBirthDate = birthDate;
    });
  }

  void _updateDocumentType(String document) {
    setState(() {
      selectedDocument = document;
    });
  }

  void _submitForm() {
    if (_formAddKey.currentState!.validate()) {
      // Crear instancia del modelo User
      final user = User(
        name: nameController.text,
        age: int.parse(ageController.text),
        id: int.parse(idController.text),
        email: emailController.text,
        idType: selectedDocument!,
        birthDate: selectedBirthDate!,
        phone: int.parse(phoneController.text),
        consult: consultController.text,
        record: recordController.text,
        diagnosis: diagnosisController.text,
      );

      showAlertDialog(context, nameController.text, user);
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
          validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
          controller: controller,
          style: Theme.of(context).textTheme.labelMedium,
          decoration: InputDecoration(
            border: InputBorder.none,
            label: Text(
              textInput,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String name, User user) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Aceptar"),
      onPressed: () {
        print('Navega');
      // Navegar a la página de detalles del usuario
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage(user: user),
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Registro exitoso"),
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
        title: const Text(
          'Historia Clínica',
          style: TextStyle(color: Colors.black),
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
                        consultController, 'Motivo de consulta', context),
                    const SizedBox(
                      height: 30,
                    ),
                    textFormLarge(recordController, 'Antecedentes', context),
                    const SizedBox(
                      height: 30,
                    ),
                    textFormLarge(diagnosisController, 'Diagnóstico', context),
                    Container(
                      margin: const EdgeInsets.only(top: 32, bottom: 48),
                      width: 394,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: WeinFluColors.brandPrimaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        child: const Text('Guardar'),
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
