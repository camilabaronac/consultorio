import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final TextEditingController? controller;
  final String text;
  final bool isLarge;
  final VoidCallback? functionTap;
  final FocusNode? focusNode;
  final bool? readOnly;

  const TextForm(
      {super.key,
      required this.text,
      this.controller,
      this.functionTap,
      this.readOnly,
      this.focusNode,
      this.isLarge = false});

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

    return widget.isLarge
        ? Container(
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator: (value) => value!.isEmpty ? textForm : null,
                controller: widget.controller,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(
                    widget.text,
                    softWrap: true,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 185, 183, 183),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Expanded(
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
