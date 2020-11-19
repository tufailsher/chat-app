import 'package:chatapp/Model/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreServie{
  /*firebase.initializeApp(config);
  var db = firebase.firestore();*/
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveProduct(Product product){
    return _db.collection("products").doc(product.productID).set(product.toMap());
  }
  Stream<List<Product>> getProducts(){
   return _db.collection("products").snapshots().map((snapshots) => snapshots.docs.map((document) => Product.fromFirestore(document.data())).toList());
    
  }
  Future <void> removeProduct(String productId){
    return _db.collection("porducts").doc(productId).delete();
  }
}