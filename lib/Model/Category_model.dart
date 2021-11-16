class Category {
  List<Categorydeltail>? data;

  Category({this.data});

  factory Category.fromJson(Map<String,dynamic> json) {
    return Category(data: (json['data'] as List).map((i) => Categorydeltail.fromJson(i)).toList());
  }


}

class Categorydeltail {
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;

  Categorydeltail({this.categoryId,this.categoryName,this.categoryImage});

  factory Categorydeltail.fromJson(Map<String, dynamic> json) {
    return Categorydeltail(categoryId: json['categoryId'], categoryName: json['categoryName'], categoryImage: json['categoryImage']);
}
}

