import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;


  const ProfileWidget({
    Key key,
    this.imagePath,
    this.isEdit = false,
    this.onClicked,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(Colors.amber)
            ),
        ],
      ),
    );
  }

  Widget buildImage(){
    final image = AssetImage(imagePath);

    return Material(
      color: Colors.transparent,
      child: Ink.image(
        image: image,
        fit: BoxFit.contain,
        width: 128,
        height: 128,
        child: InkWell(
          onTap: onClicked,
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size:20,
      ),
    ),
  );
  }

  Widget buildCircle({Widget child, double all, Color color}) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }
}