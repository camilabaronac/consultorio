import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final VoidCallback? functionTap;

  const TextForm(
      {super.key,
      required this.controller,
      required this.text,
      this.functionTap});

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
      color: Colors.black,
      fontWeight: FontWeight.normal,
    );

    const borderInput = OutlineInputBorder(gapPadding: 0);

    return Expanded(
      child: Container(
        decoration: defaultContainerInputDecoration,
        child: TextFormField(
          validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
          controller: widget.controller,
          style: Theme.of(context).textTheme.labelLarge,
          decoration: InputDecoration(
            border: borderInput,
            label: Text(
              widget.text,
              textAlign: TextAlign.start,
              style: defaultInputLabelTheme,
            ),
          ),
          onTap: widget.functionTap,
        ),
      ),
    );
  }
}
