import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app_2/model/user.dart';
import 'package:project_app_2/utils/user_preferences.dart';
import 'package:project_app_2/widget/profile_widget.dart';
import 'package:project_app_2/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences().myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            isEdit: true,
            onClicked: () async {},
          ),
          SizedBox(height: 24),
          TextFieldWidget(
            label: 'Full Name',
            text: user.name,
            onChanged: (name) {}
          ),
          SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (email) {}
          ),
          SizedBox(height: 24),
          TextFieldWidget(
            label: 'About',
            text: user.about,
            maxLines: 5,
            onChanged: (about) {}
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text('Change', style: TextStyle()),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
