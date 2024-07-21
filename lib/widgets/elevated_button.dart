import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/pages/home_page.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      },
      style: ElevatedButton.styleFrom(backgroundColor: primary),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15),
        child: Text(
          "Continue Shopping",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
