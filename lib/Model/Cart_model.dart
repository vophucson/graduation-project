class OrderDetail {
  int? success;
  List<Data>? data;

  OrderDetail({this.success, this.data});

  OrderDetail.fromJson(Map<String, dynamic> json) {
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
  String? productName;
  String? imageUrl;
  String? orderId;
  int? totalPrice;
  dynamic productSize;
  int? quantity;
  int? productPrice;

  Data(
      {this.productName,
        this.imageUrl,
        this.orderId,
        this.totalPrice,
        this.productSize,
        this.quantity,
        this.productPrice});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    imageUrl = json['imageUrl'];
    orderId = json['orderId'];
    totalPrice = json['totalPrice'];
    productSize = json['productSize'];
    quantity = json['quantity'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['imageUrl'] = this.imageUrl;
    data['orderId'] = this.orderId;
    data['totalPrice'] = this.totalPrice;
    data['productSize'] = this.productSize;
    data['quantity'] = this.quantity;
    data['productPrice'] = this.productPrice;
    return data;
  }
}