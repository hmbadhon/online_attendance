import 'package:flutter/material.dart';

class InputFormWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController fieldController;
  final Function onSaved;
  final keyType;
  InputFormWidget({
    @required this.labelText,
    @required this.hintText,
    @required this.fieldController,
    @required this.keyType,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        controller: fieldController,
        keyboardType: keyType,
        onChanged: onSaved,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 1.0),
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black54,
          ),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
