import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Model/shipService_model.dart';
import 'package:get/get.dart';

class ShipServiceController extends GetxController {
  var serviceList = <Data>[].obs;
  var isLoading = true.obs;
  var selectIndex = 0.obs;
  var priceX = 0.obs;
  @override

  void onInit() {
    super.onInit();
  }
  Future<void> fetchShipService() async{
    try {
      isLoading(true);
      var response = await APIService.getShipService();

      if (response.data!.length >= 0) {
        serviceList.clear();
        serviceList.addAll(response.data!);
      }
    }finally {
      isLoading(false);
    }
  }
}