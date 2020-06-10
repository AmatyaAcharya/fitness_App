import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  String imgPath;
  Widget build(BuildContext context) {
    imgPath = ModalRoute.of(context).settings.arguments;
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: ht,
              width: wt,
              child: Image.asset(
                imgPath,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: ht*0.011,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey[100],
                    radius: ht * 0.0325,
                    child: IconButton(
                        disabledColor: Colors.amber,
                        padding: EdgeInsets.zero,
                        iconSize: ht * 0.065,
                        color: Color(0xFFe83323),
                        splashColor: Colors.white,
                        focusColor: Colors.white,
                        highlightColor: Colors.white,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () => Navigator.pop(context)),
                  ),
                  SizedBox(width:10),
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey[100],
                    radius: ht * 0.0325,
                    child: IconButton(
                        disabledColor: Colors.amber,
                        padding: EdgeInsets.zero,
                        iconSize: ht * 0.065,
                        color: Color(0xFFe83323),
                        splashColor: Colors.white,
                        focusColor: Colors.white,
                        highlightColor: Colors.white,
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
