import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Model/Category_model.dart';
import 'package:get/get.dart';

class Homecategory extends GetxController {
  var categorieslist = <Categorydeltail>[].obs;
  var isLoading = true.obs;
  @override

  void onInit() {
    fetchCategory();
    super.onInit();
  }
  void fetchCategory() async{
    try {
      isLoading(true);
      var response = await APIService.getCategory();

      if (response.data!.length > 0) {
        categorieslist.clear();
        categorieslist.addAll(response.data!);
      }
    }finally {
      isLoading(false);
    }
  }
}