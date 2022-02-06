import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final Function leftCallback;
  CustomAppBar(this.leftIcon, {this.leftCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 50,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback(): null,
            child: _buildIcon(leftIcon),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: Icon(icon, size: 36.0),
          );
  }
}