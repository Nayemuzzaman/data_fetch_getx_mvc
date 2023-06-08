import 'package:data_fetch_getx_mvc/models/product_model.dart';
import 'package:data_fetch_getx_mvc/utils/constants.dart';
import 'package:http/http.dart' as http;

//step three 
class Api {
  static var client = http.Client();

  static Future<List?> fetchProducts() async {
    String url = BASE_URL;
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    } else {
      return null;
    }
  }
}
