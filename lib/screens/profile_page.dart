import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app_2/model/user.dart';
import 'package:project_app_2/screens/editprofile_page.dart';
import 'package:project_app_2/utils/user_preferences.dart';
import 'package:project_app_2/widget/button_widget.dart';
import 'package:project_app_2/widget/numbers_widget.dart';
import 'package:project_app_2/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences().myUser;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            child: ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
          ),
          SizedBox(height: 24),
          buildName(user),
          SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          SizedBox(height: 24),
          NumbersWidget(),
          SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) {
    return Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight:FontWeight.bold, fontSize: 24),
      ),
      SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
  }

  Widget buildUpgradeButton() {
    return ButtonWidget(
    text: 'Edit Profile',
    onClicked: () {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context)=> EditProfilePage())
        );
    },
   );
  }

  Widget buildAbout(User user){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text(user.about, style: TextStyle(fontSize: 16, height: 1.4),),
        ],
      ),
    );
  }
}