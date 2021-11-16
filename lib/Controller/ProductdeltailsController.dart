import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:get/get.dart';

class ProductdeltailsController extends GetxController{
  var productIdx = 0.obs;
  var productName =''.obs;
  var categoryName=''.obs;
  var description = ''.obs;
  var productPricex= 0.obs;
  var imageUrl= ''.obs;
  var isLoading = true.obs;
  var orderQuantity = 0.obs;
  var orderSize = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  Future<void> fetchProductview({required int productId}) async{
    try{
      isLoading(true);
     var  response = await APIService.getProductview(productId);
       productIdx(response.data![0].productId);
       productName(response.data![0].productName);
       categoryName(response.data![0].categoryName);
       description(response.data![0].description);
       productPricex(response.data![0].productPrice);
       imageUrl(response.data![0].imageUrl);

    }
    finally{
      isLoading(false);
    }

  }
}