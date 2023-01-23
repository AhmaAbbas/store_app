
import 'package:store_app/all_productmode1/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/helper1.dart';
class AllProduct_Servicees{
  Future<List<Product_Model>> get_allproduct()async{
    List<dynamic> data= await Api().get(url: "https://fakestoreapi.com/products");
        //print(data[3]);
   // List<Product_Model> listproduct = List.filled(data.length,growable: false);
        List<Product_Model> listproduct =[];
        for(int i=0;i<data.length;i++)
        {
          listproduct.add(Product_Model.fromjson(data[i]));
        }
        //print(listproduct[0].title);
        return listproduct;
      
      }
}