import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/all_productmode1/product_model.dart';
import 'package:store_app/all_productmode1/update_product.dart';

import '../screens/update_product.dart';

class Card_Product extends StatelessWidget {
  Product_Model product_model;
  Card_Product({required this.product_model});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Update_Productpage.id,arguments: product_model);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: Offset(20,20),
                  )
                ]
            ),
            height: 160,
            width: 200,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product_model.title.toString(),style: TextStyle(color: Colors.grey,fontSize: 10,),),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$'"${product_model.price.toString()}",style: TextStyle(color: Colors.black,fontSize: 20,),),
                        Icon(FontAwesomeIcons.heartCirclePlus,color: Colors.red,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 35,
            bottom: 85,
            child: Image.network(product_model.image),
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }
}
