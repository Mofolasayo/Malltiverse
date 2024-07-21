import 'package:flutter/material.dart';

class Textform extends StatelessWidget {
  const Textform({
    super.key,
    required this.label,
    required this.type,
    required this.controller,
    required this.formKey,
  });

  final String label;
  final TextInputType type;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        return null;
      },
    );
  }
}
