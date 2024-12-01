import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final VoidCallback? functionTap;
  final FocusNode? focusNode;
  final bool? readOnly;

  const TextForm(
      {super.key,
      required this.controller,
      required this.text,
      this.functionTap,
      this.readOnly,
      this.focusNode});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  
  @override
  Widget build(BuildContext context) {
    const defaultContainerInputDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)));

    const defaultInputLabelTheme = TextStyle(
      fontSize: 13,
      color: Color.fromARGB(255, 185, 183, 183),
      fontWeight: FontWeight.normal,
    );

    const borderInput = OutlineInputBorder(gapPadding: 0);

    return Expanded(
      child: Container(
        decoration: defaultContainerInputDecoration,
        child: TextFormField(
          validator: (value) => value!.isEmpty ? textForm : null,
          controller: widget.controller,
          readOnly: widget.readOnly ?? false,
          style: Theme.of(context).textTheme.labelLarge,
          decoration: InputDecoration(
            border: borderInput,
            label: Text(
              widget.text,
              textAlign: TextAlign.start,
              style: defaultInputLabelTheme,
            ),
          ),
          focusNode: widget.focusNode,
          onTap: widget.functionTap,
        ),
      ),
    );
  }
}
