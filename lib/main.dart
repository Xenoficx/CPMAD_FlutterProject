import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_app_2/screens/login_page.dart';
import 'package:project_app_2/screens/product_page.dart';


Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: Colors.black
      ),
      title: 'Food4Grab',
      routes: {
        '/login': (context)=> LoginPage(),
        '/home': (context)=> ProductPage(),
      },
      home:LoginPage(),
    );
  }
}