import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileTheme(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: -3,
          child: ListTile(
            title: const Text(
              'Old Secretariat Complex, Area 1, Garki Abaji Abji',
              style: TextStyle(fontSize: 14),
            ),
            leading: Radio<int>(
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.maximumDensity),
              activeColor: primary,
              value: 1,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          ),
        ),
        ListTileTheme(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: -3,
          child: ListTile(
            title: const Text(
              'Sokoto Street, Area 1, Garki Area 1 AMAC',
              style: TextStyle(fontSize: 14),
            ),
            leading: Radio<int>(
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.maximumDensity),
              activeColor: primary,
              value: 2,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
