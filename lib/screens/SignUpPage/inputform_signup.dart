import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  InputForm({this.hint, this.hidetext, this.controller, this.onChanged});
  final TextEditingController controller;
  final String hint;
  final bool hidetext;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 2.0),
      child: TextFormField(
        controller: controller,
        obscureText: hidetext,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
