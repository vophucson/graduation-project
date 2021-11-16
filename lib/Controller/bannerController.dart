import 'package:get/get.dart';
import 'package:appshop1/Model/bannerModel.dart';
import 'package:appshop1/Api/api_service.dart';
class BannerController extends GetxController {
  var bannerList = <Data>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  void fetchBanner() async {
    try {
      isLoading(true);
      var response =
      await APIService.getAllBanner();
      print(response.success);
      if (response.data!.length > 0) {
        bannerList.clear();
        bannerList.addAll(response.data!);
      }
    }finally {
      isLoading(false);
    }
  }
}