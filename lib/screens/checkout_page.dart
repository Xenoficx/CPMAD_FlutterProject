import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_app_2/screens/cart_page.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();


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
                onTap: (){
                  showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return Transform.scale(
                        scale: a1.value,
                        child: Opacity(
                          opacity: a1.value,
                          child: AlertDialog(
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            title: Text("Thank you!"),
                            content: Text("The Deliverer will be notified for cash payment")
                          ),
                        ),
                      );
                    },
                    transitionDuration: Duration(milliseconds: 200),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context, 
                    pageBuilder: (context, animation1, animation2) {},
                  );
                },
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
                onTap: (){
                  showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return SingleChildScrollView(
                        child: Transform.scale(
                          scale: a1.value,
                          child: Opacity(
                            opacity: a1.value,
                            child: AlertDialog(
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              title: Text("Please enter your credit card Info."),
                              content: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        labelText: "Credit Card Number"
                                      ),
                                      validator: (value){
                                        if(value.isEmpty || !RegExp(r'[0-9]{16}').hasMatch(value)) {
                                          return "Enter Correct Credit Card Number";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        labelText: "CVV"
                                      ),
                                      validator: (value){
                                        if(value.isEmpty || !RegExp(r'[0-9]{3}').hasMatch(value)) {
                                          return "Enter a valid CVV";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        labelText: "MM/YY",
                                      ),
                                     
                                      validator: (value){
                                        if(value.isEmpty || !RegExp(r'[0-9]{2}[\\/]{1}[0-9]{2}').hasMatch(value)) {
                                          return "Enter a valid date";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left:160.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          primary: Colors.amber,
                                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                        ),
                                        child: Text("Confirm"),
                                        onPressed: (){
                                          if(formKey.currentState.validate()){
                                            Navigator.pop(context, true);
                                            showDialog(
                                              context: context,
                                              builder: (context){
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                                  title: Text('Payment with Credit Card Successful'),
                                                );
                                              }
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    transitionDuration: Duration(milliseconds: 200),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context, 
                    pageBuilder: (context, animation1, animation2) {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}