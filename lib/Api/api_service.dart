import 'dart:io';
import 'package:appshop1/Model/Deletecart_model.dart';
import 'package:appshop1/Model/OrderHistory_model.dart';
import 'package:appshop1/Model/Product_model.dart';
import 'package:appshop1/Model/Profile_model.dart';
import 'package:appshop1/Model/Review_model.dart';
import 'package:appshop1/Model/orderHistoryDetail_Model.dart';
import 'package:appshop1/Model/shipperOrderDetail_Model.dart';
import 'package:appshop1/Model/shipperOrderModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appshop1/Model/login_model.dart';
import 'package:appshop1/Model/Register_model.dart';
import 'package:appshop1/Model/Category_model.dart';
import 'package:appshop1/Config.dart';
import 'package:appshop1/Model/Productview_model.dart';
import 'package:appshop1/Model/Addtocart_model.dart';
import 'package:appshop1/Model/Cart_model.dart';
import 'package:appshop1/Model/bannerModel.dart';
import 'package:appshop1/Model/shipService_model.dart';

class APIService {
  static var client = http.Client();
  static Future<LoginResponseModel> login(String email, String password) async {
    var url = Uri.parse(Config.url + Config.login);

    final response = await client.post(url, body: {
      "email": email.trim(),
      "password": password.trim(),
    });
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<RegisterResponseModel> register(String email, String password,
      String userName, String phone, String address) async {
    var url = Uri.parse(Config.url + Config.register);
    final response = await client.post(url, body: {
      "username": userName.trim(),
      "password": password.trim(),
      "phone": phone.trim(),
      "email": email.trim(),
      "address": address.trim()
    });
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 201) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<Category> getCategory() async {
    var url = Uri.parse(Config.url + Config.category + Config.allCategory);
    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return Category.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<Product> getAllProduct() async {
    var url = Uri.parse(Config.url + Config.product + Config.allProduct);
    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<getBanner> getAllBanner() async {
    var url = Uri.parse(Config.url + Config.banner);
    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return getBanner.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<productview> getProductview(int productId) async {
    var url = Uri.parse(
        Config.url + Config.product + Config.viewProductdetail + '$productId');
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return productview.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<Product> getProduct(int categorytId) async {
    var url = Uri.parse(Config.url +
        Config.product +
        Config.viewcategoryproduct +
        '$categorytId');
    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<OrderDetail> getOrderdetail(String token, int userId) async {
    var url =
        Uri.parse(Config.url + Config.order + Config.viewCart + '$userId');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whateverz
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final response = await client.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return OrderDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<CartResponseModel> Addtocart(int productId, int quantity,
      double productSize, String token, int userId) async {
    var url = Uri.parse(Config.url + Config.order + Config.addtocart);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final body = {
      "productId": productId,
      "quantity": quantity,
      "productSize": productSize,
      "userId": userId
    };
    print(body);
    final response =
        await client.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      return CartResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<Product> search(String productName) async {
    var url =
        Uri.parse(Config.url + Config.product + Config.Search + productName);
    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<shipService> getShipService() async {
    var url = Uri.parse(Config.url + Config.ship + Config.getShipService);
    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return shipService.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<RegisterResponseModel> Checkout(
      String orderId, String token, int shipId) async {
    var url = Uri.parse(Config.url + Config.order + Config.checkout);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final body = {"orderId": orderId, "shipId": shipId};
    final response =
        await client.patch(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<DeleteCarResponseModel> deleteOrder(
      String orderId, String token) async {
    var url =
        Uri.parse(Config.url + Config.order + Config.deleteCart + "$orderId");
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    final response = await client.delete(url, headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      return DeleteCarResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<UserResponse> getUser(int userId, String token) async {
    var url = Uri.parse(Config.url + Config.user + Config.IdUser + "$userId");
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whateverz
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final response = await client.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<RegisterResponseModel> edit(String userName, String phone,
      String address, String userImage, int id, String token) async {
    var url = Uri.parse(Config.url + Config.user + Config.updateProfile);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final body = {
      "username": userName.trim(),
      "phone": phone.trim(),
      "address": address.trim(),
      "userimage": userImage,
      "Id": id
    };
    print(url);
    print(body);
    final response =
        await client.patch(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 201) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
  static Future<RegisterResponseModel> change(int id,String oldPassword,String password ,String token) async {
    var url = Uri.parse(Config.url + Config.user + Config.changePassword);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final body = {
      "Id": id,
      "oldpassword": oldPassword,
      "password": password
    };
    print(body);
    final response =
    await client.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 400) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<Reviewmodel> getReview(int productId) async {
    var url =
        Uri.parse(Config.url + Config.review + Config.getReview + "$productId");
    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return Reviewmodel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<RegisterResponseModel> sendReview(
      int productId, int star, String comment, int userId, String token) async {
    var url = Uri.parse(Config.url + Config.review + Config.sendReview);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    print(url);
    final body = {
      "productId": productId,
      "star": star,
      "comment": comment,
      "userId": userId
    };
    print(body);
    final response =
        await client.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<OrderHistoryModel> getAllOrderHistory(
      int userId, String token) async {
    var url =
        Uri.parse(Config.url + Config.order + Config.orderHistory + "$userId");
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final response = await client.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return OrderHistoryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<OrderHistoryDetailModel> getOrderHistoryDetail(
      String orderId, String token) async {
    var url = Uri.parse(
        Config.url + Config.order + Config.orderHisstoryDetail + "$orderId");
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final response = await client.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return OrderHistoryDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<ShipperOrderModel> getShipperOrder(
      int shipperId, String token) async {
    var url = Uri.parse(
        Config.url + Config.shipper + Config.shipperOrder + "$shipperId");
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final response = await client.get(url, headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return ShipperOrderModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<ShipperOrderDetailModel> getShipperOrderDetail(
      String orderId, String token) async {
    var url = Uri.parse(
        Config.url + Config.shipper + Config.shipperOrderDetail + "$orderId");
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final response = await client.get(url, headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return ShipperOrderDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<RegisterResponseModel> pickUpOrder(
      String orderId, String token) async {
    var url = Uri.parse(Config.url + Config.shipper + Config.pickUpOrder);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final body = {"orderId": orderId};
    final response =
        await client.put(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 201) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<RegisterResponseModel> finishOrder(
      String orderId, String token) async {
    var url = Uri.parse(Config.url + Config.shipper + Config.finishOrder);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final body = {"orderId": orderId};
    final response =
        await client.put(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 201) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static Future<RegisterResponseModel> cancelOrder(
      String orderId, String token) async {
    var url = Uri.parse(Config.url + Config.shipper + Config.cancelOrder);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final body = {"orderId": orderId};
    final response =
        await client.put(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 201) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
