class Reviewmodel {
  int? success;
  List<Data>? data;

  Reviewmodel({this.success, this.data});

  Reviewmodel.fromJson(Map<String, dynamic> json) {
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
  String? reviewId;
  String? username;
  String? userimage;
  int? star;
  String? comment;
  String? dayComment;

  Data(
      {this.productId,
        this.reviewId,
        this.username,
        this.userimage,
        this.star,
        this.comment, this.dayComment});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    reviewId = json['reviewId'];
    username = json['username'];
    userimage = json['userimage'];
    star = json['star'];
    comment = json['comment'];
    dayComment = json['dayComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['reviewId'] = this.reviewId;
    data['username'] = this.username;
    data['userimage'] = this.userimage;
    data['star'] = this.star;
    data['comment'] = this.comment;
    data['dayComment'] = this.dayComment;
    return data;
  }
}