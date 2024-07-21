import 'package:flutter/material.dart';

//NOT IN USE
class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Form is valid')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill out the form')),
          );
        }
      },
      child: const Text('Submit'),
    );
  }
}
