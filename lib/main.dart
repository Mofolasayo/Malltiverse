import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/data/order_item.dart';
import 'package:malltiverse/data/order_service.dart';
import 'package:malltiverse/pages/home_page.dart';
import 'package:malltiverse/providers/cart_provider.dart';
import 'package:malltiverse/providers/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(OrderItemAdapter());
  await OrderService.openBox();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        // Other providers
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white),
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))))),
          
      home: const HomePage(),
    );
  }
}
