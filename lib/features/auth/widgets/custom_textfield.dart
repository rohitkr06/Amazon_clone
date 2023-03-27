import 'package:flutter/material.dart';

class Customtextfiel extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  const Customtextfiel(
      {super.key, required this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hinttext';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
    );
  }
}
