import 'package:flutter/material.dart';


class Product {
    String productName;
    String image;
    String added;
    String shop;
    List<Measurement> measurements;

    Product({
        required this.productName,
        required this.image,
        required this.added,
        required this.shop,
        required this.measurements,
    });

}

class Measurement {
    String image;
    String name;
    int price;
    int left;
    int sales;

    Measurement({
        required this.image,
        required this.name,
        required this.price,
        required this.left,
        required this.sales,
    });

}



class ProductProvider extends ChangeNotifier {
  List <Product>cart = [];
  List<Product> Products =[
    Product(
    productName: 'Product 1',
    image: 'https://www.shutterstock.com/shutterstock/photos/1775086994/display_1500/stock-photo-brand-new-electrical-socket-isolated-on-gray-wall-renovated-studio-apartment-power-supply-1775086994.jpg',
    added: '2022-10-10',
    shop: 'Shop 1',
    measurements: [
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '1kg',
        price: 1000,
        left: 100,
        sales: 50,
      ),
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '2kg',
        price: 2000,
        left: 200,
        sales: 100,
      ),
    ],
  ),
  Product(
    productName: 'Product 2',
    image: 'https://www.shutterstock.com/shutterstock/photos/1775086994/display_1500/stock-photo-brand-new-electrical-socket-isolated-on-gray-wall-renovated-studio-apartment-power-supply-1775086994.jpg',
    added: '2022-10-10',
    shop: 'Shop 2',
    measurements: [
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '1kg',
        price: 1000,
        left: 100,
        sales: 50,
      ),
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '2kg',
        price: 2000,
        left: 200,
        sales: 100,
      ),
    ],
  ),
  Product(
    productName: 'Product 3',
    image: 'https://www.shutterstock.com/shutterstock/photos/1775086994/display_1500/stock-photo-brand-new-electrical-socket-isolated-on-gray-wall-renovated-studio-apartment-power-supply-1775086994.jpg',
    added: '2022-10-10',
    shop: 'Shop 3',
    measurements: [
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '1kg',
        price: 1000,
        left: 100,
        sales: 50,
      ),
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '2kg',
        price: 2000,
        left: 200,
        sales: 100,
      ),
    ],
  ),
  Product(
    productName: 'Product 4',
    image: 'https://www.shutterstock.com/shutterstock/photos/1775086994/display_1500/stock-photo-brand-new-electrical-socket-isolated-on-gray-wall-renovated-studio-apartment-power-supply-1775086994.jpg',
    added: '2022-10-10',
    shop: 'Shop 4',
    measurements: [
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '1kg',
        price: 1000,
        left: 100,
        sales: 50,
      ),
      Measurement(
        image: 'https://www.shutterstock.com/sh',
        name: '2kg',
        price: 2000,
        left: 200,
        sales: 100,
      ),
    ],
  ),
  ];

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cart.remove(product);
    notifyListeners();
  }


  void clearCart() {
    cart.clear();
    notifyListeners();
  }

}



