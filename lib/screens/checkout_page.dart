import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app_2/screens/cart_page.dart';

class CheckoutPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          iconSize: 60.0,
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(() => CartPage());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Column(
            children: [
              Text(
                'Choose payment method',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 30.0),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border:Border.all(
                      color: Colors.amber
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: ListTile(
                    leading: Icon(Icons.monetization_on_outlined, color: Colors.black),
                    title: Text('By Cash'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                onTap: (){},
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border:Border.all(
                      color: Colors.amber
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: ListTile(
                    leading: Icon(Icons.payment_outlined, color: Colors.black),
                    title: Text('By Credit Card'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}