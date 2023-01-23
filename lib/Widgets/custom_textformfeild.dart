import 'package:flutter/material.dart';

class Custom_Textformfeild extends StatelessWidget {
  Custom_Textformfeild({this.label_text,this.icon,this.onchaged,this.obsecure=false, this.inputtype});
  String? label_text;
  IconData? icon;
  Function(String)? onchaged;
  bool? obsecure;
  TextInputType? inputtype;
  //Function(String)? validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText:obsecure! ,
        keyboardType: inputtype,
        validator: (value){
          if(value!.isEmpty)
          {
            return 'this feild is required';
          }
        },
        onChanged: onchaged,
        decoration: InputDecoration(
            labelText: label_text,
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)
            ),
            suffixIcon: IconButton(onPressed: (){},icon: Icon(icon,
              color: Colors.black,),),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)
            )
        ),
      ),
    );
  }
}
