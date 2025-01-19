import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:agenda_clinica/ui/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalInformation extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController idController;
  final TextEditingController phoneController;
  final TextEditingController ageController;

  final void Function(DateTime birthDate)
      onBirthDateSelected; // Callback para fecha
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

  String? selectedDocument;
  DateTime selectedDate = DateTime.now();
  final FocusNode _focusNode = FocusNode();

  // Controlador específico para la fecha de nacimiento
  late TextEditingController birthDateController;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con un valor vacío
    birthDateController = TextEditingController();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // Abre el selector de fecha cuando el campo recibe el foco
        _selectDate(context);
      }
    });
  }

  @override
  void dispose() {
    birthDateController.dispose();
     _focusNode.dispose(); // Libera el controlador
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {

    _focusNode.unfocus();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {

      setState(() {
        selectedDate = picked;

        // Formatear la fecha a "dd/MM/yyyy"
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

      // Actualiza el controlador con la fecha formateada
      birthDateController.text = formattedDate;

      });
      _focusNode.unfocus();
      print(selectedDate);
      widget.onBirthDateSelected(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          personalInformation['personalInfo']!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Row(
              children: [
                DropdownMenu(
                  hintText: personalInformation['documentType']!,
                  enableFilter: true,
                  inputDecorationTheme: InputDecorationTheme(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 185, 183, 183),
                          fontStyle: FontStyle.normal),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 185, 183, 183),
                          fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  menuStyle: const MenuStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
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
                TextForm(
                    controller: widget.idController,
                    text: personalInformation['documentNumber']!),
                const SizedBox(width: 10),
                TextForm(
                    controller: widget.nameController, text: personalInformation['name']!),
                const SizedBox(width: 10),
                TextForm(controller: widget.ageController, text: personalInformation['age']!),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            TextForm(
                controller: widget.emailController, text: personalInformation['email']!),
            const SizedBox(width: 10),
            TextForm(
              controller: birthDateController,
              text: personalInformation['birthDate']!,
              functionTap: () => _selectDate(context),
              focusNode: _focusNode,
              readOnly: true,
            ),
            const SizedBox(width: 10),
            TextForm(controller: widget.phoneController, text: personalInformation['phone']!),
          ],
        ),
      ],
    );
  }
}
