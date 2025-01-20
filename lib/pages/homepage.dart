import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_checkout_outlined))
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
