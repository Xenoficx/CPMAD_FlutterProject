import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app_2/screens/about_page.dart';
import 'package:project_app_2/screens/cart_page.dart';
import 'package:project_app_2/screens/product_page.dart';
import 'package:project_app_2/screens/profile_page.dart';



class MyDrawer extends StatelessWidget{

  final Function onTap;
  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration:BoxDecoration(color:Colors.amber),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:<Widget>[
                    Text('Welcome to Food4Grab',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Get.to(()=> ProductPage());
              }
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('Cart'),
              onTap: () {
                Get.to(()=> CartPage());
              }
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              onTap: () {
                Get.to(()=> ProfilePage());
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('About us'),
              onTap: () {
                Get.to(()=> AboutPage());
              }
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new_outlined),
              title: Text('Sign Out'),
              onTap: () {
                Navigator.of(context).pushNamed('/login');
              }
            ),
          ],
        ),
      ),
    );
  }
}