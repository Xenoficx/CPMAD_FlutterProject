import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app_2/constants/colors.dart';
import 'package:project_app_2/controller/cartController.dart';
import 'package:project_app_2/widget/drawer.dart';
import 'package:project_app_2/widget/restaurant_info.dart';

import 'cart_page.dart';

class ProductPage extends StatelessWidget {
  
  final _foodName = [
    'Soba Soup',
    'Sai Ua Samun Phrai',
    'Tomato Checken',
    'Macaroni',
    'Chicken Wings',
    'Sliced Bread',
  ];

  final _foodPrice = [
    '\$12',
    '\$18',
    '\$15',
    '\$13',
    '\$20',
    '\$12',
  ];

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var cartController = Get.put(CartController());

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackground,
      drawer: MyDrawer(
        onTap: (context, i) {
          Navigator.pop(context);
        }
      ),
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.list, color: Colors.black, 
          ),
          onTap: () => scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: InkWell(
                splashColor: Colors.amberAccent,
                highlightColor: Colors.blueAccent.withOpacity(0.5),
                onTap: (){
                  Get.to(()=> CartPage());
                },
                child: Stack(
                  children: [
                    IconButton(
                      icon:Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      onPressed: null,
                    ),
                    Positioned(
                      child: Stack(
                        children: [
                          Icon(Icons.brightness_1,
                          size: 20.0,
                          color: Colors.red[700],
                        ),
                        Positioned(
                          top: 3.0,
                          right: 7,
                          child: Center(
                            child: Obx(
                              ()=> Text(
                                cartController.count.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body:Column(
        children: [
          RestaurantInfo(),
          SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(6, (index){
                return InkWell(
                  splashColor: Colors.amberAccent,
                  highlightColor: Colors.amberAccent.withOpacity(1.0),
                  onTap:(){
                    cartController.addToCart(index);
                  },
                  child: _buildGridCards(index, 'assets/images/dish${index + 1}.png', _foodName[index], _foodPrice[index]),
                );
              }),
            ),
          ),
        ],
      )
    );
  }


  Widget _buildGridCards (int index, String imgPath, String foodName, String foodPrice){
    return Card(
      color: Colors.amber,
      elevation:5,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
      ),
      child:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:140,
              width:150,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Text(foodName, style: TextStyle(fontSize:16.0, fontWeight: FontWeight.bold),
          ),
          Text(foodPrice, style:TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}