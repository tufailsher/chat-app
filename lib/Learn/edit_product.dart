import 'package:chatapp/Learn/products.dart';
import 'package:chatapp/Model/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/product_provider.dart';


class EditProduct extends StatefulWidget {
  final Product product;
  EditProduct({this.product});
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  @override
  void dispose(){
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    if (widget.product== null){
      //new record
      nameController.text="";
      priceController.text="";


    }else{
      //controller update
      nameController.text=widget.product.name;
      priceController.text=widget.product.price.toString();
      //State Update
      new Future.delayed(Duration.zero,(){
        final productProvider = Provider.of<ProductProvider>(context,listen: false);
        productProvider.loadValues(Product());

      });



    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit products"),
      /*  actions: [
          IconButton(icon: Icon(Icons.arrow_back,size: 30.0,), onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>Products()
                ),
            );
          }
          ),
        ],*/
      ),
      body: ListView(
        children:<Widget> [
          TextField(
            decoration: InputDecoration(hintText: "product name"),
            onChanged: (value){
              productProvider.changeName(value);

            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "product price"),
            onChanged: (value) {
              print(value);
              productProvider.changePrice(value);

            }
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            child: Text("save"),
            onPressed: (){
              productProvider.saveProduct();
              // Navigator.of(context).pop();
            },
          ),
          SizedBox(height: 20.0,),
          (widget.product !=null) ? RaisedButton(
            child: Text("Delete"),
            onPressed: (){
              productProvider.removeProduct(widget.product.productID);
            },
          ): Container(),
          RaisedButton(
            color: Colors.red,
            child: Text("Delete"),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
