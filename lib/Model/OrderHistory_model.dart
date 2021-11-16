class OrderHistoryModel {
  int? success;
  List<Data>? data;

  OrderHistoryModel({this.success, this.data});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? productName;
  int? productPrice;
  String? imageUrl;
  int? totalPrice;
  String? status;
  dynamic productSize;
  int? quantity;
  String? orderDate;

  Data(
      {this.orderId,
        this.productName,
        this.productPrice,
        this.imageUrl,
        this.totalPrice,
        this.status,
        this.productSize,
        this.quantity,
        this.orderDate});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    imageUrl = json['imageUrl'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    productSize = json['productSize'];
    quantity = json['quantity'];
    orderDate = json['orderDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['imageUrl'] = this.imageUrl;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['productSize'] = this.productSize;
    data['quantity'] = this.quantity;
    data['orderDate'] = this.orderDate;
    return data;
  }
}