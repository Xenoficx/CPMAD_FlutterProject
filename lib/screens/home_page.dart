import 'package:flutter/material.dart';
import 'package:project_app_2/constants/colors.dart';
import 'package:project_app_2/model/restaurant.dart';
import 'package:project_app_2/screens/cart_page.dart';
import 'package:project_app_2/widget/custom_app_bar.dart';
import 'package:project_app_2/widget/drawer.dart';
import 'package:project_app_2/widget/food_list.dart';
import 'package:project_app_2/widget/food_list_view.dart';
import 'package:project_app_2/widget/restaurant_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackground,
      drawer: MyDrawer(
        onTap: (context, i) {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            Icons.list,
            leftCallback: () => scaffoldKey.currentState.openDrawer(),
          ),
          RestaurantInfo(),
          FoodList(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, restaurant),
          Expanded(
            child: FoodListView(
              selected,
              (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              restaurant,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
        backgroundColor: kPrimaryColor,
        elevation: 2,
        child: Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 30),
      ),
    );
  }
}
