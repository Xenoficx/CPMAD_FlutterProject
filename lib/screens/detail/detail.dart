import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:project_app_2/constants/colors.dart';
import 'package:project_app_2/controller/cartcontroller.dart';
import 'package:project_app_2/model/food.dart';
import 'package:project_app_2/screens/cart_page.dart';
import 'package:project_app_2/screens/detail/widget/food_detail.dart';
import 'package:project_app_2/screens/detail/widget/food_img.dart';
import 'package:project_app_2/widget/custom_app_bar.dart';
import 'package:project_app_2/widget/drawer.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  DetailPage(this.food);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onTap: (context, i){
          Navigator.pop(context);
        },
      ),
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              Icons.arrow_back_ios_outlined,
              leftCallback: () => Navigator.of(context).pop(),
            ),
            FoodImg(widget.food),
            FoodDetail(widget.food),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 56,
        child: RawMaterialButton(
          fillColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 30),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Text(widget.food.quantity.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ))
              ),
            ],
          ),
          onPressed: () {
            Get.to(()=> CartPage());
          },
        ),
      ),
    );
  }
}