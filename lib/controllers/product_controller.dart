import 'package:data_fetch_getx_mvc/models/product_model.dart';
import 'package:get/state_manager.dart';

import '../services/api.dart';
//step four
class ProductsController extends GetxController {
  var isLoading = true.obs;
  var productsList = <Products>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }
 
 //fetch list of product
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await Api.fetchProducts();
      if (products != null) {
        productsList.value = products as List<Products>;
      }
    } finally {
      isLoading(false);
    }
  }
}
