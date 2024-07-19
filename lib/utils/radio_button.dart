import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileTheme(
          horizontalTitleGap: 2,
          child: ListTile(
            title: const Text(
              'Old Secretariat Complex, Area 1, Garki Abaji Abji',
              style: TextStyle(fontSize: 13),
            ),
            leading: Radio<int>(
          
              activeColor: primary,
              value: 1,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          ),
        ),
        ListTileTheme(
          horizontalTitleGap: 2,
          child: ListTile(
            title: const Text(
              'Sokoto Street, Area 1, Garki Area 1 AMAC',
              style: TextStyle(fontSize: 13),
            ),
            leading: Radio<int>(
              activeColor: primary,
              value: 2,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
