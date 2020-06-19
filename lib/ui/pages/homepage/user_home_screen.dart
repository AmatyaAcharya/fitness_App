import 'dart:ffi';

import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/Models/workout.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/services/auth.dart';
import 'package:flutterdev/services/database.dart';
import 'package:flutterdev/ui/pages/homepage/calorie_adder.dart';
import 'package:flutterdev/ui/pages/homepage/calorie_edit.dart';
import 'package:flutterdev/ui/pages/profilepage/profilepage.dart';
import 'package:flutterdev/ui/pages/profilepage/settings_form.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterdev/sampledata/recipe.dart';
import 'package:flutterdev/ui/pages/homepage/nutrition_intake.dart';
import 'package:flutterdev/ui/pages/homepage/radial_progress.dart';
import 'package:flutterdev/ui/pages/homepage/recipe_prev.dart';
import 'package:flutterdev/ui/pages/homepage/saved_workout_bar.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Datamod dum = new Datamod(
        age: '',
        uid: '',
        name: '',
        height: '0',
        weight: '0',
        activelevel: '0',
        protein: '1',
        gender: '',
        fat: '1',
        bmi: '0',
        carbs: '1',
        caloriesdone: '1',
        calories: '2');
        User dumy = new User('1', 1);
    final userspecifics = Provider.of<Datamod>(context) ?? dum;
    final user = Provider.of<User>(context)??dumy;
    final recip=Provider.of<List<Recipe>>(context)??[];
    final dumm=[Workouts(workouts: " "),Workouts(workouts: " "),Workouts(workouts: " "),Workouts(workouts: " ")];
    final workouts=Provider.of<List<Workouts>>(context)??dumm;
    //print(recip.first.name);
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    //CalorieAdder dia = new CalorieAdder();
    double carb = 64.5, fat = 23.2;
    double prot;
    //int dum=int.parse(userspecifics.fat);
    //print(userspecifics.bmi);
    //print("chal bey ${user.uid}");
    void showSetting() async {
      await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return StreamProvider<Datamod>.value(
              value: DatabaseService(uid: user.uid).userspecfics,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30),
                    topRight: const Radius.circular(30),
                  ),
                  child: Container(
                    //color: Colors.black,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey[850],
                          Colors.black87,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: CalorieEdit(),
                    ),
                  ),
                ),
              ),
            );
          });
      await showDialog(
          context: context,
          builder: (context) {
            //final userdisplay = Provider.of<Datamod>(context);
            Datamod dumm = new Datamod(
        age: '',
        uid: '',
        name: '',
        height: '0',
        weight: '0',
        activelevel: '0',
        protein: '1',
        gender: '',
        fat: '1',
        bmi: '0',
        carbs: '1',
        caloriesdone: '1',
        calories: '2');
            return StreamBuilder<Datamod>(
              stream: DatabaseService(uid: user.uid).userspecfics,
              builder: (context, snapshot) {
                Datamod dum=snapshot.data??dumm;
                return Padding(
                  padding: EdgeInsets.only(
                    top: ht * (1 / 12),
                    bottom: 0,
                  ),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.transparent,
                    content: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          decoration: BoxDecoration(
                           gradient: LinearGradient(
                           colors: [Colors.grey[850], Colors.black87],
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           ),
                         ),
                          width: wt * 0.7,
                          height: ht * 0.33,
                          
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.white,letterSpacing: 1.5),
                                  children: [
                                    TextSpan(
                                      text:"WELL",
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text:" DONE",
                                      style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(text:'\n'),
                                    TextSpan(text:'\n'),
                                    TextSpan(
                                    text: "CALORIES LEFT: ", 
                                    style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                    text:"${int.parse(dum.calories) - int.parse(dum.caloriesdone)}",
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(text:'\n'),
                                    TextSpan(text:'\n'),
                                    TextSpan(text: "We have suggested some tasty, healthy recipes to help you meet your qouta."),
                                    TextSpan(text:'\n'),
                                  ],
                                   
                                )),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                  style: BorderStyle.solid
                                  ), 
                                  borderRadius: BorderRadius.circular(50),
                                  ),
                                color: Colors.transparent,
                                child: Text("OK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                  onPressed:()=> Navigator.pop(context),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            );
          });
    }

    prot = 7;
    return MultiProvider(
      
      providers: [
            StreamProvider<Datamod>.value(value: DatabaseService(uid:user.uid ).userspecfics),
            StreamProvider<User>.value(value: AuthService().user),
            
          ],
          child: Stack(
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
                      subtitle: Text("Hello, ${userspecifics.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              letterSpacing: 2)),
                      trailing: ClipOval(child: Image.asset("assets/user.jpg")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 19.5, top: 3),
                          child: RadialProgress(ht: ht * 0.21, wt: wt * 0.34),
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
                                onPressed: () => showSetting(),
                                label: Text(
                                  "Add Calorie Intake",
                                ),
                              ),
                            ),
                            NutritionIntake(
                              nutrition: "CARBS",
                              parentAmt: double.parse(userspecifics.carbs),
                              amtConsumed: double.parse(userspecifics.carbs),
                              width: wt,
                              height: ht,
                              progressColor: Color(0XFFffce47),
                            ),
                            NutritionIntake(
                              nutrition: "PROTEIN",
                              parentAmt: double.parse(userspecifics.carbs),
                              amtConsumed: double.parse(userspecifics.protein),
                              width: wt,
                              height: ht,
                              progressColor: Color(0XFF52c748),
                            ),
                            NutritionIntake(
                              nutrition: "FATS",
                              parentAmt: double.parse(userspecifics.carbs),
                              amtConsumed: double.parse(userspecifics.fat),
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
                    child: RichText(
                      text:TextSpan(
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                        children:[
                      TextSpan(text:"SUGGESTED ",
                      ),
                          TextSpan(text:'RECIPES',style: TextStyle(color: Color(0xFFe83323)))
                        ]
                    ),
                    )
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20),
                          for (int i = 0; i < recip.length ; i++)
                          if(int.parse(recip[i].kiloCaloriesBurnt)<(int.parse(userspecifics.calories)-int.parse(userspecifics.caloriesdone)))
                            RecipeCard(
                              recipe: recip[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SavedWorkoutBar(workouts: workouts,),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
