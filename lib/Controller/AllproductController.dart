import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Model/Product_model.dart';
import 'package:get/get.dart';

class Homeproduct extends GetxController {
  var productlist = <ProductDetail>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchAllproduct();
    super.onInit();
  }

  void fetchAllproduct() async {
    try {
      isLoading(true);
      var response =
      await APIService.getAllProduct();

      if (response.data!.length > 0) {
        productlist.clear();
        productlist.addAll(response.data!);
      }
    }finally {
      isLoading(false);
    }
  }
}
