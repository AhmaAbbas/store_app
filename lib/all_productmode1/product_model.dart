import 'package:store_app/all_productmode1/rating_model.dart';

class Product_Model{
  dynamic id;
   String title;
   String price;
   String description;
   String image;
   Rating rating ;
   String? category;
  Product_Model({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });
  factory Product_Model.fromjson(Map<String, dynamic> jsondata){
    return Product_Model(id: jsondata["id"],
        title: jsondata["title"],
        price: jsondata["price"].toString(),
        description: jsondata["description"],
        image: jsondata['image'],
      category: jsondata["category"],
      rating: Rating.fromjson(jsondata["rating"]),
    );
  }

}