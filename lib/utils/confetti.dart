import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class Confetti extends StatefulWidget {
  const Confetti({super.key});

  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiController.play(); // Trigger the animation automatically
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            colors: const [
              Colors.red,
              Colors.purple,
              Colors.blue,
              Colors.green,
              Colors.yellow
            ], // confetti colors
            createParticlePath: generateRandomPath, // random path for confetti
          ),
        ],
      ),
    );
  }

  // Generate a random path for the confetti particles
  Path generateRandomPath(Size size) {
    final Path path = Path();
    final Random random = Random();

    final double width = size.width;
    final double height = size.height;

    path.moveTo(random.nextDouble() * width, random.nextDouble() * height);

    for (int i = 0; i < 5; i++) {
      path.lineTo(random.nextDouble() * width, random.nextDouble() * height);
    }

    path.close();
    return path;
  }
}
