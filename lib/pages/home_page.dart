import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/constants/svgIcons.dart';
import 'package:malltiverse/models/product_model.dart';
import 'package:malltiverse/screens/cart_screen.dart';
import 'package:malltiverse/screens/checkout_screen.dart';
import 'package:malltiverse/screens/home_screen.dart';
import 'package:malltiverse/services/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Product> cartItems = [];

  late Future<Product> futureProduct;
  //final String category = 'men';
  @override
  void initState() {
    super.initState();
    futureProduct = ProductService(
            BASE_URL: BASE_URL,
            apiKey: apiKey,
            appId: appId,
            organizationId: organizationId)
        .getProduct();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      HomeScreen(futureProduct: futureProduct),
      const CartScreen(),
      const CheckoutScreen()
    ];

    onTappedBar(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    String getTitle(int currentIndex) {
      if (currentIndex == 0) {
        return 'Product List';
      } else if (currentIndex == 1) {
        return 'My Cart';
      } else {
        return 'CheckOut';
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 15),
          child: Image.asset('assets/images/Malltiverse Logo.png'),
        ),
        leadingWidth: 140,
        //centerTitle: true,
        title: Text(
          getTitle(currentIndex),
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 19),
        ),
      ),
      body: items[currentIndex],
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 6, bottom: 11),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(42, 42, 42, 1),
            // selectedItemColor: primary,
            currentIndex: currentIndex,
            onTap: onTappedBar,
            items: [
              BottomNavigationBarItem(
                  icon: currentIndex == 0
                      ? SvgPicture.string(svgicons.home2)
                      : SvgPicture.string(svgicons.home),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.string(svgicons.cart), label: ''),
              BottomNavigationBarItem(
                  icon: currentIndex == 2
                      ? SvgPicture.string(svgicons.checkout2)
                      : SvgPicture.string(svgicons.checkout),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
