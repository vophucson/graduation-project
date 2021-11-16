class ShipperOrderModel {
  int? success;
  List<Data>? data;

  ShipperOrderModel({this.success, this.data});

  ShipperOrderModel.fromJson(Map<String, dynamic> json) {
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
  int? totalPrice;
  String? username;
  String? address;
  String? phone;
  String? userimage;
  String? orderDate;
  String? expireDate;

  Data(
      {this.orderId,
        this.totalPrice,
        this.username,
        this.address,
        this.phone,
        this.userimage,
        this.orderDate,
        this.expireDate});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    totalPrice = json['totalPrice'];
    username = json['username'];
    address = json['address'];
    phone = json['phone'];
    userimage = json['userimage'];
    orderDate = json['orderDate'];
    expireDate = json['expireDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['totalPrice'] = this.totalPrice;
    data['username'] = this.username;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['userimage'] = this.userimage;
    data['orderDate'] = this.orderDate;
    data['expireDate'] = this.expireDate;
    return data;
  }
}