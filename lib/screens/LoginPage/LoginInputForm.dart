import 'package:flutter/material.dart';

class LoginInputForm extends StatelessWidget {
  final bool hidetext;
  final IconData prefixicon;
  final IconData suffixicon;
  final String hint;
  final Function onChanged;

  LoginInputForm({
    this.prefixicon,
    this.suffixicon,
    this.hint,
    this.hidetext,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 2.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: hidetext,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(suffixicon),
            onPressed: () {},
          ),
          prefixIcon: Icon(
            prefixicon,
            color: Colors.black,
          ),
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
