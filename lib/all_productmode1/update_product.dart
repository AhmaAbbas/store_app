import 'dart:convert';

import 'package:store_app/all_productmode1/product_model.dart';
import 'package:store_app/helper/helper1.dart';

class Update_ProductServices{
  Future<Product_Model> updateproduct({
    required dynamic id,
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  })async{
    print('id= $id');
    Map<String,dynamic> data = await Api().put(url: "https://fakestoreapi.com/products/$id",
        body: {
          "title":title,
          "price": price,
          "description": description,
          "image":image,
          "category": category,
        });
    return Product_Model.fromjson(data);
  }
}