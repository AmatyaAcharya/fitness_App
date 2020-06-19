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
        //Navigator.pushNamed(context, '/workoutview',arguments: imgPath);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WorkoutView(imgPath: imgPath);
            },
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: FadeInImage.assetNetwork(
          fadeInDuration: const Duration(seconds: 1),
          fadeInCurve: Curves.bounceIn,
          placeholder: 'assets/loading.png',
          image: imgPath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
