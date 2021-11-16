class DeleteCarResponseModel {
  final int? success;
  final String? message;


  DeleteCarResponseModel({this.success, this.message});

  factory DeleteCarResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return DeleteCarResponseModel(
      success: json["success"] != null ? json["success"] : "",
      message: json["message"] != null ? json["message"]: "",
    );
  }
}
