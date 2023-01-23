import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Api{
  Map<String,String>? headers;
  Future<List<dynamic>> get({required String url})async{
    http.Response response=await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        List<dynamic> data =jsonDecode(response.body);
        //print(data[3]);
        return data;
      }else{
      throw Exception("please check statuscode ${response.statusCode}");
    }
  }
  Future<dynamic> post({required String url,@required dynamic body,@required String? taken})async{
    if(taken!=null){
       headers={
        "Authorization":"Bearer $taken",
      };
    }
    http.Response response =await http.post(Uri.parse("https://fakestoreapi.com/products"),
      body: body,
      headers: headers
    );
   if(response.statusCode==200)
     {
       Map<String,dynamic> data=jsonDecode(response.body);
       return data;
     }
   else
     {
       throw Exception("check ${response.statusCode} and ${jsonDecode(response.body)}");
     }
  }
  Future<dynamic> put({required String url,@required dynamic body,@required String? taken})async{
    if(taken!=null){
      headers={
        "Authorization":"Bearer $taken",
      };
    }
    print("url: $url body:$body  taken:$taken");
    http.Response response =await http.post(Uri.parse(url),
        body: body,
        headers: headers
    );

    if(response.statusCode==200)
    {
      Map<String,dynamic> data=jsonDecode(response.body);
      print(data);
      return data;
    }
    else
    {
      throw Exception("check ${response.statusCode} and ${jsonDecode(response.body)}");
    }
  }
}
// body: {
// "title":'test',
// "price":"13.5",
// "description":'lorem ipsum set',
// "image":"https//i.pravatar.cc",
// "category":"electronic"
// }