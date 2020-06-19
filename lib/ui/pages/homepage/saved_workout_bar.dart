import 'package:flutter/material.dart';
import 'package:flutterdev/Models/workout.dart';
import 'package:flutterdev/ui/pages/homepage/saved_workout_screen.dart';

class SavedWorkoutBar extends StatelessWidget {
  final List<Workouts> workouts;

  SavedWorkoutBar({this.workouts});

  @override
  Widget build(BuildContext context) {
    final double wt = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.white,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SavedWorkoutScreen(workouts: workouts,);
            },
          ),
        );
      }, //() => Navigator.pushNamed(context, '/savedworkout'),
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
          top: 20,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [Colors.grey[850], Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "CHECK OUR ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                      fontSize: 15),
                ),
                Text(
                  "WORKOUTS",
                  style: TextStyle(
                      color: Color(0xFFe83323),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                      fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int i = 0; i < 4; i++)
                    FadeInImage.assetNetwork(
                      width: wt * 0.2,
                      height: wt * 0.17,
                      fadeInDuration: const Duration(seconds: 1),
                      fadeInCurve: Curves.bounceIn,
                      placeholder: 'assets/loading.png',
                      image: workouts[i].workouts,
                    ),
                ],
              ),
            )
          ],
        ),

        //color: Colors.red /*Color(0xFFde2e21)*/
      ),
    );
  }
}
