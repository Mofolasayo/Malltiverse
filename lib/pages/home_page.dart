import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/constants/svgIcons.dart';
import 'package:malltiverse/models/product_model.dart';
import 'package:malltiverse/pages/order_history.dart';
import 'package:malltiverse/screens/cart_screen.dart';
import 'package:malltiverse/screens/checkout_screen.dart';
import 'package:malltiverse/screens/favorite_screen.dart';
import 'package:malltiverse/screens/home_screen.dart';
import 'package:malltiverse/services/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static void navigateToTab(BuildContext contex, int index) {
    final state = contex.findAncestorStateOfType<_HomePageState>();
    state?.updateIndex(index);
  }
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
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
      const FavoriteScreen(),
      const CartScreen(),
      const CheckoutScreen()
    ];


    String getTitle(int currentIndex) {
      if (currentIndex == 0) {
        return 'Product List';
      } else if (currentIndex == 1) {
        return 'Wishlist';
      } else if (currentIndex == 2) {
        return 'My Cart';
      } else {
        return 'CheckOut';
      }
    }

    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OrderHistory()));
              },
              icon: const Icon(Icons.history))
        ],
      ),
      body: items[currentIndex],
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 6, bottom: 11),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            iconSize: 24,

            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromRGBO(42, 42, 42, 1),
            // selectedItemColor: primary,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: currentIndex == 0
                      ? SvgPicture.string(svgicons.home2)
                      : SvgPicture.string(svgicons.home),
                  label: ''),
              BottomNavigationBarItem(
                  icon: currentIndex == 1
                      ? SvgPicture.string(svgicons.favorite2)
                      : SvgPicture.string(svgicons.favorite),
                  label: ''),
              BottomNavigationBarItem(
                  icon: currentIndex == 2
                      ? SvgPicture.string(svgicons.cart2)
                      : SvgPicture.string(svgicons.cart),
                  label: ''),
              BottomNavigationBarItem(
                  icon: currentIndex == 3
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
