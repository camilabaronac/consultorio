import 'package:agenda_clinica/widgets/text_form.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController idController;
  final TextEditingController phoneController;
  final TextEditingController ageController;

  final void Function(DateTime birthDate) onBirthDateSelected; // Callback para fecha
  final void Function(String document) onDocumentSelected; // Callback


  const PersonalInformation({
    super.key,
    required this.nameController, 
    required this.emailController,
    required this.idController,
    required this.phoneController,
    required this.ageController,
    required this.onBirthDateSelected,
    required this.onDocumentSelected,
  });

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  late String userName;


  List<String> documents = <String>[
    'Cédula de ciudadanía',
    'Cédula de extranjería',
    'Pasaporte',
    'Registro Civil',
    'Tarjeta de Identidad',
  ];

  String? selectedDocument;
  DateTime selectedDate = DateTime.now();

  // Controlador específico para la fecha de nacimiento
  late TextEditingController birthDateController;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con un valor vacío
    birthDateController = TextEditingController();

  }

  @override
  void dispose() {
    birthDateController.dispose(); // Libera el controlador
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // Actualiza el controlador con la fecha seleccionada
        birthDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
       widget.onBirthDateSelected(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Datos personales del paciente',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Row(
              children: [
                DropdownMenu(
                  initialSelection: documents.first,
                  menuStyle: const MenuStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  dropdownMenuEntries:
                      documents.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),
                  onSelected: (value) {
                  setState(() {
                    selectedDocument = value; // Actualiza la selección
                    widget.onDocumentSelected(value!);
                  });
                },
                ),
                const SizedBox(width: 20),
                TextForm(controller: widget.idController, text: 'Número de documento'),
                const SizedBox(width: 10),
                TextForm(controller: widget.nameController, text: 'Nombre completo'),
                const SizedBox(width: 10),
                TextForm(controller: widget.ageController, text: 'Edad'),
                
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            TextForm(
                    controller: widget.emailController, text: 'Correo electrónico'),
            const SizedBox(width: 10),
            TextForm(
                controller: birthDateController, text: 'Fecha de nacimiento', functionTap: () => _selectDate(context),),
            const SizedBox(width: 10),
            TextForm(controller: widget.phoneController, text: 'Teléfono'),
          ],
        ),
      ],
    );
  }
}
