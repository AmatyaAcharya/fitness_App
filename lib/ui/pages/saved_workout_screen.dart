import "package:flutter/material.dart";
import 'package:flutterdev/ui/pages/saved_workout_gridview.dart';

class SavedWorkoutScreen extends StatelessWidget {
  final workOuts = [
    "assets/test1.png",
    "assets/test2.png",
    "assets/test3.png",
    "assets/test4.png",
    "assets/test1.png",
    "assets/test2.png",
    "assets/test3.png",
    "assets/test4.png",
    "assets/test1.png",
    "assets/test2.png",
    "assets/test3.png",
    "assets/test4.png",
  ];
  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black87,
            Colors.grey[850],
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: 0.65,
                crossAxisCount: 2,
                primary: false,
                padding: EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  for (int i = 0; i < workOuts.length; i++)
                    WorkView(imgPath: workOuts[i]),
                ],
              ),
              Positioned(
                top: ht * 0.04,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
