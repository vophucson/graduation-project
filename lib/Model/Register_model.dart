class RegisterResponseModel {
  final int? success;
  final String? data;

  RegisterResponseModel({this.success, this.data});

  factory RegisterResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return RegisterResponseModel(
      success: json["success"] != null ? json["success"] : "",
      data: json["message"] != null ? json["message"] : "",
    );
  }
}
