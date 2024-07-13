# Malltiverse

The shopping application developed with Flutter provides users with a seamless shopping experience. Users can explore a wide range of products, add items to their cart, and 

effortlessly proceed to checkout. The app is equipped with a user-friendly bottom navigation bar, making it simple for users to switch between various screens and product categories. 

Additionally, the scrollable grid view coupled with dots indicators allows for easy browsing of products. Moreover, the app incorporates a robust cart system that ensures a smooth and 

efficient shopping process for the users.
## Features
- **Home Screen**: Displays product categories and featured products.
 
- **Category Items Screen**: Shows items for a selected category in a scrollable grid view.
  
- **Add to Cart**: Allows users to add items to their cart from the product listing.
  
- **Cart Screen**: Shows all items added to the cart with options to increase/decrease quantity and view total price.
  
- **Checkout Screen**: Allows users to proceed with their purchase.
  
- **Radio Buttons**: Provides options for user selections in various forms.

## Getting Started

Installation
Clone the repository:

```git clone https://github.com/your-username/retail-product-app.git```

```cd retail-product-app```

Install dependencies:
```flutter pub get```

Run the app:
```flutter run```

Appetizo: https://appetize.io/embed/b_nqvg4lis75w4od6fswv73b72de

Apk: https://drive.google.com/file/d/18havEA6hj-Ty5xtiPFpQHxzPEIinQL_m/view?usp=sharing


## Api Integration
This project uses the Timbu API to fetch product data.
```
class ProductService {
  final String BASE_URL;
  final String apiKey;
  final String appId;
  final String organizationId;

  ProductService(
      {required this.BASE_URL,
      required this.apiKey,
      required this.appId,
      required this.organizationId});
  Future<Product> getProduct() async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?organization_id=$organizationId&Appid=$appId&Apikey=$apiKey'));
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product items...');
    }
  }
}
```


<img width="426" alt="Screenshot 2024-07-13 at 22 54 01" src="https://github.com/user-attachments/assets/5f0d2a38-b761-4d85-aadf-6fb2f170391a">

<img width="426" alt="Screenshot 2024-07-13 at 22 54 49" src="https://github.com/user-attachments/assets/44e91545-a333-42a9-bc20-5434d1e67541">

<img width="426" alt="Screenshot 2024-07-13 at 22 55 32" src="https://github.com/user-attachments/assets/33e019af-c98d-455a-bf49-0b49dba1bc1c">

https://github.com/user-attachments/assets/dd7253db-94e0-4023-b23a-4ae1ade6f714

