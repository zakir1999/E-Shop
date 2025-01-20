import 'package:http/http.dart' as http;

import '../Get/product_get_model.dart';

class RemoteServices{
  static var client=http.Client();
  static Future<List<Product>?>fetchProducts() async{
    var response=await client.get(Uri.parse("https://fakestoreapi.com/products"));
  }
}