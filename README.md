# Malltiverse
The Flutter project is a mobile application that includes a user-friendly checkout and payment system. 

Users can input their payment details, validate the information, and proceed to a success screen upon successful payment. The app also offers flexible checkout options for delivery or pickup, along with a feature for providing contact details. 

Built with Flutter, 
the shopping application provides a seamless user experience with a wide range of products, easy cart management, streamlined checkout process, state management using Provider, and 
local storage using Hive. 

It incorporates a well-designed bottom navigation bar for easy screen and category navigation, as well as a scrollable grid view with dot indicators for 
intuitive product exploration. Additionally, the app includes a robust cart system to enhance the overall shopping experience.

## Features
- **Home Screen**: Displays product categories and featured products.
 
- **Category Items Screen**: Shows items for a selected category in a scrollable grid view.
  
- **Add to Cart**: Allows users to add items to their cart from the product listing.
  
- **Cart Screen**: Shows all items added to the cart with options to increase/decrease quantity and view total price.
  
- **Checkout Screen**: Allows users to proceed with their purchase.
  
- **Radio Buttons**: Provides options for user selections in various forms.
  
- **Form Validation**:  Ensures that the user enters valid card details.
  
- **State Management**: Uses Provider for managing the cart state.
  
- **Local Sorage**:  Uses Hive for persisting data locally
  
## Getting Started

Installation
Clone the repository:

```git clone https://github.com/your-username/retail-product-app.git```

```cd retail-product-app```

Install dependencies:
```flutter pub get```

Run the app:
```flutter run```

Appetizo: https://appetize.io/app/b_qbb2cvgmwbxqzecgbk52dpi4ia

Apk: https://drive.google.com/file/d/16d1BBJtZZDCKV7y6oKVZpps-P3elXkDN/view?usp=sharing


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

[Screen Recording 2024-07-21 at 14.41.54.zip](https://github.com/user-attachments/files/16324681/Screen.Recording.2024-07-21.at.14.41.54.zip)




