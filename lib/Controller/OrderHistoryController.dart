import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:get/get.dart';
import 'package:appshop1/Model/OrderHistory_model.dart';

class OrderHistoryController extends GetxController {
  var historyList = <Data>[].obs;
  var isLoading = true.obs;
  LoginController loginController = Get.put(LoginController());
  @override
  void onInit() {
    fetchHistory();
    super.onInit();
  }

  Future<void> fetchHistory() async {
    try {
      isLoading(true);
      var response = await APIService.getAllOrderHistory(
          loginController.box.read('userId'), loginController.box.read('token'));

      if (response.data != null) {
        historyList.clear();
        historyList.addAll(response.data!);
      }
    } finally {
      isLoading(false);
    }
  }
}
