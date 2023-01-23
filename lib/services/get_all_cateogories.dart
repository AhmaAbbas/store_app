import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/helper1.dart';

class Get_AllCategories{
  Future<List<dynamic>> get_allcategories()async{
   // http.Response response= await http.get(Uri.parse("https://fakestoreapi.com/products"));

     List<dynamic> data=await Api().get(url: "https://fakestoreapi.com/products");
     return data;

  }
}