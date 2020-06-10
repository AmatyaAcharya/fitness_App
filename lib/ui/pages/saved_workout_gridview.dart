import "package:flutter/material.dart";
import 'workout_view.dart';
class WorkView extends StatelessWidget {
  final String imgPath;

  const WorkView({this.imgPath});

  @override
  Widget build(BuildContext context) {
    final wt = MediaQuery.of(context).size.width;
    final ht = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        print("photocheck");
        Navigator.pushNamed(context, '/workoutview',arguments: imgPath);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Image.asset(
          imgPath,
          //height: ht*0.9,
          /*width: wt * 0.25,*/ fit: BoxFit.fill,
        ),
      ),
    );
  }
}
