import 'package:flutter/material.dart';

class NutritionIntake extends StatelessWidget {
  final String nutrition;
  final double amtConsumed;
  final double height, width;
  final Color progressColor;
   double parentAmt;

  NutritionIntake(
      {this.nutrition,
      this.amtConsumed,
      this.height,
      this.width,
      this.progressColor,
      this.parentAmt});

  @override
  Widget build(BuildContext context) {
    if(parentAmt==0)
    parentAmt=10;
    double wth = width * 0.27;
    var ch=amtConsumed/parentAmt;
    if(ch==0)
    wth = wth * 0.05;
    else
    wth = wth * ch;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          nutrition,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 7,
                  width: width*0.27,
                  color: Colors.transparent,
                ),
                Container(
                  height: 7,
                  width: wth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${amtConsumed}g",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.check,
              color: Color(0xFFe83323),
            )
          ],
        ),
      ],
    );
  }
}
