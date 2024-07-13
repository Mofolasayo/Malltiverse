import 'package:flutter/material.dart';

class Textform extends StatelessWidget {
  const Textform({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Form(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
        ),
      ),
    );
  }
}
