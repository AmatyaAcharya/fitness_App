//import 'dart:ui';
import 'dart:async';
import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutter/material.dart';
import 'package:flutterdev/services/database.dart';
//import 'package:flutterdev/sampledata/recipe.dart';
import 'package:flutterdev/ui/pages/homepage/calorie_adder.dart';
//import 'package:flutterdev/ui/pages/homepage/nutrition_intake.dart';
//import 'package:flutterdev/ui/pages/homepage/recipe_prev.dart';
//import 'package:flutterdev/ui/pages/homepage/saved_workout_bar.dart';
import 'package:flutterdev/ui/pages/homepage/user_home_screen.dart';
import 'package:flutterdev/ui/pages/profilepage/profilepage.dart';
import 'package:provider/provider.dart';
//import 'nav_bar.dart';
//import 'package:flutterdev/ui/pages/homepage/radial_progress.dart';
//import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  int currentIndex;
  HomeScreen(this.currentIndex);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int check = widget.currentInd;

  Widget callPage(int currentindex) {
    switch (currentindex) {
      case 0:
        return UserHomeScreen();
      case 1:
        return null;
      case 2:
        return ProfilePage();
        break;
      default:
    }
  }

  CalorieAdder dia = new CalorieAdder();

  @override
  Widget build(BuildContext context) {
    //my attempt at getting user id
    //final user = Provider.of<User>(context);
    //print(user.uid);
    //print("print user uid ${DatabaseService.ud}");
    return StreamProvider<List<Datamod>>.value(
      value: DatabaseService().userspecfics,
      child: SafeArea(
        child: Container(
          //width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey[850], Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                currentIndex: widget.currentIndex,
                onTap: (value) => (setState(() => widget.currentIndex = value)),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home, color: Colors.white),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.grey[900]),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.fastfood, color: Colors.white),
                    title: Text(
                      "Recipes",
                      style: TextStyle(color: Colors.grey[900]),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person, color: Colors.white),
                    title: Text(
                      "Profile",
                      style: TextStyle(color: Colors.grey[900]),
                    ),
                  )
                ],
                backgroundColor: Colors.grey[900],
                iconSize: 27.5,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(color: Color(0xFFe83323)),
                selectedItemColor: Color(0xFFe83323),
                selectedIconTheme: IconThemeData(color: Color(0xFFe83323)),
                showSelectedLabels: true,
              ),
            ),
            body: callPage(widget.currentIndex),
          ),
        ),
      ),
    );
  }
}
/*Stack(
            children: <Widget>[
              /*Upper info block*/ Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: ht * 0.35,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(40),
                    bottomRight: const Radius.circular(40),
                  ),
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.only(
                      top: ht * 0.01,
                      left: wt * 0.04,
                      right: wt * 0.04,
                      bottom: ht * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                              style: TextStyle(
                                  color: Color(0xFFe83323),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  letterSpacing: 2)),
                          subtitle: Text("Hello, Amatya",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  letterSpacing: 2)),
                          trailing:
                              ClipOval(child: Image.asset("assets/user.jpg")),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 19.5, top: 3),
                              child: RadialProgress(
                                  ht: ht * 0.21, wt: wt * 0.34, progress: 0.7),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: ht * 0.009, top: ht * 0.003),
                                  height: ht * 0.04,
                                  width: wt * 0.43,
                                  child: FloatingActionButton.extended(
                                    splashColor: Colors.white,
                                    backgroundColor: Colors.red[900],
                                    icon: Icon(
                                      Icons.add_circle,
                                    ),
                                    onPressed: () => dia.calorieDialog(context),
                                    label: Text(
                                      "Add Calorie Intake",
                                    ),
                                  ),
                                ),
                                NutritionIntake(
                                  nutrition: "CARBS",
                                  parentAmt: carb,
                                  amtConsumed: carb,
                                  width: wt,
                                  height: ht,
                                  progressColor: Color(0XFFffce47),
                                ),
                                NutritionIntake(
                                  nutrition: "PROTEIN",
                                  parentAmt: carb,
                                  amtConsumed: prot,
                                  width: wt,
                                  height: ht,
                                  progressColor: Color(0XFF52c748),
                                ),
                                NutritionIntake(
                                  nutrition: "FATS",
                                  parentAmt: carb,
                                  amtConsumed: fat,
                                  width: wt,
                                  height: ht,
                                  progressColor: Color(0XFF30eaff),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /*recipe/workout preview block*/ Positioned(
                top: ht * 0.38,
                right: 0,
                left: 0,
                child: Container(
                  height: ht * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10,
                          left: 30,
                        ),
                        child: Text(
                          "TOP RECIPES",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20),
                              for (int i = 0; i < recipes.length; i++)
                                RecipeCard(
                                  recipe: recipes[i],
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: SavedWorkoutBar(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),*/
