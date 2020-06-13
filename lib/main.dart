import 'package:flutter/material.dart';
import 'package:flutterdev/authenticate/auth.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/ui/pages/profile_screen.dart';
import 'package:flutterdev/ui/pages/saved_workout_screen.dart';
import 'package:flutterdev/ui/pages/workout_view.dart';
import 'wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: Wrapper(),
        home: ProfileScreen(),
      ),
    );
  }
}
/*runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        //'/':(context)=> Wrapper(),
        '/': (context) => ProfileScreen(),
        '/savedworkout': (context) => SavedWorkoutScreen(),
        '/workoutview':(context)=>WorkoutView(),
      },
    ),
  );*/
