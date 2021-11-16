class ShipperOrderDetailModel {
  int? success;
  List<Data>? data;

  ShipperOrderDetailModel({this.success, this.data});

  ShipperOrderDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? imageUrl;
  int? productPrice;
  int? totalPrice;
  int? quantity;
  String? username;
  String? address;
  String? phone;
  String? orderDate;
  String? expireDate;
  String? shipName;
  int? shipPrice;
  dynamic productSize;

  Data(
      {this.orderId,
        this.productName,
        this.imageUrl,
        this.productPrice,
        this.totalPrice,
        this.quantity,
        this.username,
        this.address,
        this.phone,
        this.orderDate,
        this.expireDate,
        this.shipName,
        this.shipPrice,
        this.productSize});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    productName = json['productName'];
    imageUrl = json['imageUrl'];
    productPrice = json['productPrice'];
    totalPrice = json['totalPrice'];
    quantity = json['quantity'];
    username = json['username'];
    address = json['address'];
    phone = json['phone'];
    orderDate = json['orderDate'];
    expireDate = json['expireDate'];
    shipName = json['shipName'];
    shipPrice = json['ShipPrice'];
    productSize = json['productSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['productName'] = this.productName;
    data['imageUrl'] = this.imageUrl;
    data['productPrice'] = this.productPrice;
    data['totalPrice'] = this.totalPrice;
    data['quantity'] = this.quantity;
    data['username'] = this.username;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['orderDate'] = this.orderDate;
    data['expireDate'] = this.expireDate;
    data['shipName'] = this.shipName;
    data['ShipPrice'] = this.shipPrice;
    data['productSize'] = this.productSize;
    return data;
  }
}