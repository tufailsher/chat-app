import 'package:chatapp/Model/Product.dart';
import 'package:chatapp/Services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreServie();
  String _name;
  double _price;
  String _productId;
  var uuid = Uuid();

  //Getters
  String get name => _name;

  double get price => _price;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  loadValues(Product product) {
    _name = product.name;
    _price = product.price;
    _productId = product.productID;
  }

  saveProduct() {
    var newproduct = Product(name: name, price: price, productID: uuid.v4());
    firestoreService.saveProduct(newproduct);
  }

  removeProduct(String productId) {
    firestoreService.removeProduct(productId);
  }
}
