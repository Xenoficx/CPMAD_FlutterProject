import 'package:flutter/material.dart';
import 'package:project_app_2/screens/product_page.dart';
import 'package:project_app_2/services/firebaseauth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  //Controllers for email and password textfields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool signUp = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        //hide back arrow button
        automaticallyImplyLeading: false,
        title: Text('Login to Food4Grab', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(12.0),
            child:TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: "Password",
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () async{
              if (signUp){
                var newuser = await FirebaseAuthService().signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                if (newuser != null){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> ProductPage()));
                }
              } else {
                var reguser = await FirebaseAuthService().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                if (reguser != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProductPage()));
                }
              }
            },
            child:signUp ? Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)) : Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          SizedBox(height: 9),
          OutlineButton(
            onPressed: (){
              setState(() {
                signUp = !signUp;
              });
            },
            child: signUp ? Text("Have an account? Sign In"): Text("Create an account"),
          )
        ],
      ),
    );
  }
} 