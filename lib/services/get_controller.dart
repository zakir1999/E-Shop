import 'package:eshop/services/services.dart';
import 'package:get/get.dart';

import '../Get/product_get_model.dart';
class ProductController extends GetxController{
  var productItems= <Product>[].obs;
  var isLoading=true.obs;
  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }


void fetchProducts()async{
  try{
    isLoading(true);
    var products=await RemoteServices.fetchProducts();
    if(products!=null){
      productItems.assignAll(products);
    }

  }finally{
    isLoading(false);
  }
  }
}