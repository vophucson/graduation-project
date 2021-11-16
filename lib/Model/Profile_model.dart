class UserResponse {
  int? success;
  List<Data>? data;

  UserResponse({this.success, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? userName;
  String? phone;
  String? email;
  String? address;
  String? userimage;

  Data(
      {this.id,
        this.userName,
        this.phone,
        this.email,
        this.address,
        this.userimage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userName = json['userName'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    userimage = json['userimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['userName'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['userimage'] = this.userimage;
    return data;
  }
}