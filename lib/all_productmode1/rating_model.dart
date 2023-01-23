class Rating{
  final num rate;
  final int count;

  Rating({required this.rate, required this.count});
  factory Rating.fromjson(jsondata){
    return Rating(rate: jsondata["rate"],
      count: jsondata["count"],
    );
  }
}