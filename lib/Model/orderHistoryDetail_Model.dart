class OrderHistoryDetailModel {
  int? success;
  List<Data>? data;

  OrderHistoryDetailModel({this.success, this.data});

  OrderHistoryDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? orderDate;
  String? expireDate;
  int? quantity;
  int? totalPrice;
  String? status;
  dynamic productSize;
  String? shipNane;
  String? shipperName;
  String? phoneShipper;
  int? shipPrice;
  String? shipAddress;

  Data(
      {this.orderId,
        this.productName,
        this.productPrice,
        this.imageUrl,
        this.orderDate,
        this.expireDate,
        this.quantity,
        this.totalPrice,
        this.status,
        this.productSize,
        this.shipNane,
        this.shipperName,
        this.phoneShipper,
        this.shipPrice,
        this.shipAddress});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    imageUrl = json['imageUrl'];
    orderDate = json['orderDate'];
    expireDate = json['expireDate'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    productSize = json['productSize'];
    shipNane = json['shipNane'];
    shipperName = json['shipperName'];
    phoneShipper = json['phoneShipper'];
    shipPrice = json['shipPrice'];
    shipAddress = json['shipAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['imageUrl'] = this.imageUrl;
    data['orderDate'] = this.orderDate;
    data['expireDate'] = this.expireDate;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['productSize'] = this.productSize;
    data['shipNane'] = this.shipNane;
    data['shipperName'] = this.shipperName;
    data['phoneShipper'] = this.phoneShipper;
    data['shipPrice'] = this.shipPrice;
    data['shipAddress'] = this.shipAddress;
    return data;
  }
}