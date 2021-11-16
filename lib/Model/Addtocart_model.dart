class CartResponseModel {
  final int? success;


  CartResponseModel({this.success});

  factory CartResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return CartResponseModel(
      success: json["success"] != null ? json["success"] : "",
    );
  }
}
