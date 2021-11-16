class productview {
  int?success;
  List<Data>? data;

  productview({this.success, this.data});

  productview.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? productId;
  String? productName;
  String? categoryName;
  String? description;
  int? productPrice;
  String? imageUrl;

  Data(
      {this.productId,
        this.productName,
        this.categoryName,
        this.description,
        this.productPrice,
        this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    categoryName = json['categoryName'];
    description = json['description'];
    productPrice = json['productPrice'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['categoryName'] = this.categoryName;
    data['description'] = this.description;
    data['productPrice'] = this.productPrice;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}