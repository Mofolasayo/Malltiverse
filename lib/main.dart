import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/pages/home_page.dart';
import 'package:malltiverse/utils/cartItems.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartItems()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
          )),
      home: const HomePage(),
    );
  }
}
