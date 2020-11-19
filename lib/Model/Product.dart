
class Product{
  final String productID;
  final String name;
  final double price;
  Product({this.productID,this.name,this.price});
  Map <String,dynamic> toMap(){
    return{
      'productid':productID,
      'name':name,
      'price':price,
    };
  }
  Product.fromFirestore(Map<String,dynamic>firestore)
  : productID = firestore["productID"],
    name = firestore["name"],
    price = firestore["price"];
}