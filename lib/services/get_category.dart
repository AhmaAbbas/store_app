import 'dart:convert';

import 'package:store_app/all_productmode1/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/helper1.dart';
class Get_ServiceCategory{
  Future<List<Product_Model>> get_category({required String categoryname})async{
   // http.Response response=await http.get(Uri.parse("https://fakestoreapi.com/products/category/$categoryname"));


        List<dynamic> data =await Api().get(url: "https://fakestoreapi.com/products/category/$categoryname");
        List<Product_Model> categorylist =[];
        for(int i=0;i<data.length;i++)
        {
          categorylist.add(Product_Model.fromjson(data[i]));
        }
        return categorylist;


  }
}