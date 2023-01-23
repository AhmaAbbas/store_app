import 'dart:convert';

import 'package:store_app/all_productmode1/product_model.dart';
import 'package:store_app/helper/helper1.dart';

class Add_Product{
  Future<Product_Model> addproduct({
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  })async{
    Map<String,dynamic> data = await Api().post(url: "https://fakestoreapi.com/products",
        body: {
        "title":title,
        "price": num.parse(price),
        "description": description,
        "image":image,
        "category": category,
        });
    return Product_Model.fromjson(data);
  }
}