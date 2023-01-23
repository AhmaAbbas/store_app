import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/all_productmode1/update_product.dart';
import 'package:store_app/helper/helper1.dart';
import 'package:store_app/screens/update_product.dart';

import 'screens/home_page.dart';
void main() {
  runApp( Store_App());
}

class Store_App extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home_Page.id:(context)=>Home_Page(),
    Update_Productpage.id:(context)=>Update_Productpage(),
      },
      initialRoute: Home_Page.id,
    );
  }
}




