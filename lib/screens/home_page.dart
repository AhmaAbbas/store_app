import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/all_productmode1/product_model.dart';
import 'package:store_app/services/get-all-product.dart';

import '../Widgets/cardproduct.dart';

class Home_Page extends StatelessWidget {
  static String  id='/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("New Trend",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.cartPlus,color: Colors.black,))
            ],
            elevation: 0,
          ),
          body:Padding(
            padding: const EdgeInsets.only(left: 16,right:16,top:70),
            child: FutureBuilder<List<Product_Model>>(
              future: AllProduct_Servicees().get_allproduct(),
              builder: (context,snapshot){
                if(snapshot.hasData)
                  {
                    List<Product_Model> products=snapshot.data!;
                    print(products[1]);
                    return  GridView.builder(
                      itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100,
                        ),
                        itemBuilder:(context,index){
                          return  Card_Product(product_model: products[index],);
                        });
                  }
                else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        )
    );
  }
}

