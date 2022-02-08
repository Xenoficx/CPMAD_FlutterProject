import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app_2/screens/product_page.dart';
import 'package:project_app_2/widget/map.dart';

class AboutPage extends StatelessWidget {
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
            Get.to(() => ProductPage());
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, left: 115.0),
            child: Text(
              'More About Us',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            onPressed: () {
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
                        title: Text("Contact Us",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Manager: +65 3424 8793',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Office: +65 3134 2723',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Support: +65 9898 2950',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
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
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              'About Us',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            onPressed: () {
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
                          title: Text("About Us",
                              style: TextStyle(
                                  fontSize: 26.0, fontWeight: FontWeight.bold)),
                          content: Text(
                            "We are a company that provide food delivery for everyone and anyone!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
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
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              'Social Media',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            onPressed: () {
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
                        title: Text("Social Media",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Instagram: @food4grab',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Facebook: @grab4food',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
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
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              'Location',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            onPressed: () {
              Get.to(() => MapPage());
            },
          ),
        ],
      ),
    );
  }
}
