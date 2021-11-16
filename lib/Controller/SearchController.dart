import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Model/Product_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var productlist = <ProductDetail>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }
  Future<void> fetchSearchview({required String productName}) async{
    try{
      isLoading(true);
      var  response = await APIService.search(productName);
      if(response.data!.length >=0)
      {
        productlist.clear();
        productlist.addAll(response.data!);
      }
    }
    finally{
      isLoading(false);
    }

  }
}