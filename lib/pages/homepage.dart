import 'package:eshop/Get/product_get_model.dart';
import 'package:eshop/services/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// import 'package:flutter/scheduler.dart
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class homepage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_checkout_outlined))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(

              () {
                if(productController.isLoading.value){
                  return const Center(
                    child:CircularProgressIndicator(),
                  );
                }
                else {
                  return GridView.builder(
                    itemCount: productController.productItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return ProductItemsDisplay(
                          product: productController.productItems[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItemsDisplay extends StatelessWidget {
  final Product product;

  const ProductItemsDisplay({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product.image),
              ),
            ),
          ),
          Gap(10.0),
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.green,
                ),
                child: Row(
                  children: [
                    Text(
                      product.rating.rate.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Gap(5.0),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                ),
              ),
              Text(
                product.category.name.toLowerCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12.0),
              )
            ],
          ),
          Gap(10.0),
          Text("\$${product.price}",style: TextStyle(fontSize: 20.0),)
          
        ],
      ),
    );
  }
}
