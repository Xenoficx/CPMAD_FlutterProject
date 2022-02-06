import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(context, '4.8', 'Ranking'),
          VerticalDivider(),
          buildButton(context, '3', 'Dishes Bought'),
          
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, String value, String text) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height:2),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}