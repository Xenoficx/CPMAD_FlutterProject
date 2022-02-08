import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app_2/controller/cartController.dart';
import 'package:project_app_2/screens/product_page.dart';

import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    var cart = cartController.cart;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Get.to(()=>ProductPage());
          },
        ),
        title: Text(
          'Cart Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Center(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Total: ' + cartController.cartCount.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    int cartIndex = cart.keys.toList()[index];
                    int count = cart[cartIndex];
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/dish${cartIndex + 1}.png"),
                              fit: BoxFit.fitHeight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      title: Text('Quantity: $count'),
                      trailing: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            cartController.clear(cartIndex);
                          }),
                    );
                  }),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                ),
                child: Text("Proceed to Checkout"),
                onPressed: () {
                  Get.to(() => CheckoutPage());
                }),
          ),
        ],
      ),
    );
  }
}
