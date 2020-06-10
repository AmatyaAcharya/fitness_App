

import 'package:flutter/material.dart';
import 'package:flutterdev/ui/pages/profile_screen.dart';
import 'package:flutterdev/ui/pages/saved_workout_screen.dart';
import 'package:flutterdev/ui/pages/workout_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ProfileScreen(),
        '/savedworkout': (context) => SavedWorkoutScreen(),
        '/workoutview':(context)=>WorkoutView(),
      },
    ),
  );
}
