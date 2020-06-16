import 'package:flutter/material.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/services/auth.dart';
import 'package:flutterdev/ui/pages/profilepage/profilepage.dart';
//import 'package:flutterdev/uiprofilepage/profilepage.dart';
import 'package:flutterdev/ui/pages/home_screen.dart';
import 'package:flutterdev/ui/pages/homepage/saved_workout_screen.dart';
import 'package:flutterdev/ui/pages/homepage/workout_view.dart';
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
        home: Wrapper(),
        //home:ProfilePage(),
        //home: HomeScreen(0),
        //home:ProfilePage(),
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
