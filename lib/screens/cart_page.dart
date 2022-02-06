import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app_2/screens/checkout_page.dart';
import 'package:project_app_2/screens/home_page.dart';

class CartPage extends StatefulWidget {

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var quantity1 = 1;
  var total = 15;
  var quantity2 = 1;
  var total2 = 20;
  var subtotal = 5;

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
            Get.to(() => HomePage());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "Shopping Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 26.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage("assets/images/dish1.png"),
                          ),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Container(
                  width: 100.0,
                  child: Text(
                    "Soba Soup",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: InkWell(
                            child: Icon(
                              Icons.add, 
                              color: Colors.white, 
                              size: 15.0),
                              onTap: (){
                                setState(() {
                                  quantity1 += 1;
                                  total = quantity1 * 15;
                                });
                              },
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('${quantity1}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(4.0)),
                      child:
                          InkWell(
                            child: Icon(
                              Icons.remove, 
                              color: Colors.white, 
                              size: 15.0),
                              onTap: (){
                                setState(() {
                                  if (quantity1 != 1){
                                    quantity1 -= 1;
                                    total = quantity1 * 15;
                                  } else {

                                  }
                                });
                              },
                            ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "\$ ${total}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage("assets/images/dish2.png"),
                          ),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Container(
                  width: 100.0,
                  child: Text(
                    "Sai Ua Samun Phrai",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: InkWell(
                            child: Icon(
                              Icons.add, 
                              color: Colors.white, 
                              size: 15.0),
                              onTap: (){
                                setState(() {
                                  quantity2 += 1;
                                  total2 = quantity2 * 20;
                                });
                              },
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('${quantity2}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(4.0)),
                      child:
                          InkWell(
                            child: Icon(
                              Icons.remove, 
                              color: Colors.white, 
                              size: 15.0),
                              onTap: (){
                                setState(() {
                                  if (quantity2 != 1){
                                    quantity2 -= 1;
                                    total2 = quantity2 * 20;
                                  } else {

                                  }
                                });
                              },
                            ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "\$ ${total2}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Add More Items Here

            //Total
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                Text("\$ ${total + total2}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Charge",
                    style: TextStyle(
                      fontSize: 14.0,
                    )),
                Text("\$5", style: TextStyle(fontSize: 16.0)),
              ],
            ),
            Divider(),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text("\$ ${total + total2 + 5}",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                ),
                child: Text("Proceed to Checkout"),
                onPressed: () {
                  Get.to(()=> CheckoutPage());
                }
              ),
          ],
        ),
      ),
    );
  }
}
