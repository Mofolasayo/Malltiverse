import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/models/product_model.dart';
import 'package:malltiverse/utils/image_tiles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({
    super.key,
    required this.futureProduct,
    required this.category,
  });

  final Future<Product> futureProduct;
  final String category;
  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: FutureBuilder<Product>(
        future: widget.futureProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final product = snapshot.data!;
            final categoryItems = product.items.where((item) {
              return item.categories
                  .any((category) => category.name == widget.category);
            }).toList();

            if (categoryItems.isEmpty) {
              return const Center(
                  child: Text('No items found for this category'));
            }

            final int pageCount = (categoryItems.length / 2).ceil();

            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: pageCount,
                    itemBuilder: (context, pageIndex) {
                      final startIndex = pageIndex * 2;
                      final endIndex = (startIndex + 2) < categoryItems.length
                          ? startIndex + 2
                          : categoryItems.length;
                      final itemsToShow =
                          categoryItems.sublist(startIndex, endIndex);

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.5,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: itemsToShow.length,
                        itemBuilder: (context, gridIndex) {
                          final item = itemsToShow[gridIndex];
                          final price = item.currentPrice.isNotEmpty &&
                                  item.currentPrice[0].ngn.isNotEmpty
                              ? item.currentPrice[0].ngn[0].toString()
                              : 'No prices yet!';

                          return ImageTiles(item: item, price: price);
                        },
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: pageCount,
                  effect: const SlideEffect(
                    dotHeight: 9,
                    dotWidth: 9,
                    activeDotColor: primary,
                    dotColor: Colors.grey,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data found, try again later!'));
          }
        },
      ),
    );
  }
}
