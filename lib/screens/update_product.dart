
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/all_productmode1/product_model.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_textformfeild.dart';
import '../Widgets/snakbar.dart';
import '../all_productmode1/update_product.dart';

class Update_Productpage extends StatefulWidget {
  static String id="/updateProduct";

  @override
  State<Update_Productpage> createState() => _Update_ProductpageState();
}

class _Update_ProductpageState extends State<Update_Productpage> {
  String? product_name,description,image;

  String? price;

  bool inAsynccll=false;

  @override
  Widget build(BuildContext context) {
    Product_Model product=ModalRoute.of(context)!.settings!.arguments as Product_Model ;
    return ModalProgressHUD(
      inAsyncCall: inAsynccll,
      child: SafeArea(
          child:Scaffold(
            appBar: AppBar(
              title: Text("Update Product",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custom_Textformfeild(
                    label_text: "Product Name",
                    icon: FontAwesomeIcons.productHunt,
                    onchaged: (data){
                      product_name=data;
                    },
                  ),
                  SizedBox(height: 12,),
                  Custom_Textformfeild(
                    label_text: "description",
                    icon: Icons.description_outlined,
                    onchaged: (data){
                      description=data;
                    },
                  ),
                  SizedBox(height: 12,),
                  Custom_Textformfeild(
                    label_text: "price",
                    icon: FontAwesomeIcons.dollarSign,
                    inputtype: TextInputType.number,
                    onchaged: (data){
                      price=data;
                    },
                  ),
                  SizedBox(height: 12,),
                  Custom_Textformfeild(
                    label_text: "image",
                    icon: FontAwesomeIcons.image,
                    onchaged: (data){
                      image=data;
                    },
                  ),
                  SizedBox(height: 20,),
                  Custom_Button(
                    data: "Update",
                    ontap: ()async{
                      setState(() {
                        inAsynccll=true;
                      });
                       try{
                        await updateproduct(product);
                        snackbar(context,"update product Succeded");
                      }
                      catch(error){
                        print("error: ${error.toString()}");
                      }
                      setState(() {
                        inAsynccll=false;
                      });

                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  Future<void> updateproduct(Product_Model product) async {
    await Update_ProductServices().updateproduct(
        id: product.id,
        title: product_name==null?product.title:product_name!,
        price:price==null?product.price: price!,
        image:image==null?product.image:image!,
        description:description==null?product.description:description! ,
        category: product.category!,
    );
  }
}
