import 'package:flutter/material.dart';
import 'package:project_app_2/constants/colors.dart';
import 'package:project_app_2/model/food.dart';
import 'package:project_app_2/screens/detail/detail.dart';

class FoodQuantity extends StatefulWidget {
  final Food food;
  FoodQuantity(this.food);

  @override
  State<FoodQuantity> createState() => _FoodQuantityState();
}

class _FoodQuantityState extends State<FoodQuantity> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.3, 0),
            child: Container(
              width: 120,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text('\$',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text(
                    widget.food.price.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.5, 0),
            child: Container(
              height: double.maxFinite,
              width: 170,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        if (widget.food.quantity >= 1){
                          widget.food.quantity = widget.food.quantity - 1;
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DetailPage(widget.food),), (route) => route.isFirst,);
                        }
                      });
                    },
                    child: Text('-',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Text(widget.food.quantity.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ),
                  TextButton(
                    onPressed: (){ 
                      setState(() {
                        widget.food.quantity = widget.food.quantity + 1;
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DetailPage(widget.food),), (route) => route.isFirst,);
                      });
                    },
                    child: Text('+',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}