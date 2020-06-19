import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/sampledata/recipe.dart';
import 'package:flutterdev/services/database.dart';
import 'package:flutterdev/ui/pages/homepage/recipeview.dart';
//import 'package:flutterdev/ui/pages/profilepage/detail_view.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({this.recipe});

  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    void showCalLeft() async {
      
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
                  Datamod dum = snapshot.data??dumm;
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
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.5),
                                        children: [
                                          TextSpan(
                                            text: "WELL",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text: " DONE",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(text: '\n'),
                                          TextSpan(text: '\n'),
                                          TextSpan(
                                            text: "CALORIES LEFT: ",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          TextSpan(
                                            text:
                                                "${int.parse(dum.calories) - int.parse(dum.caloriesdone)}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          TextSpan(text: '\n'),
                                          TextSpan(text: '\n'),
                                          TextSpan(
                                              text:
                                                  "Hope you liked the recipe! View more of these in recipes section"),
                                          TextSpan(text: '\n'),
                                        ],
                                      )),
                                  FlatButton(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.red,
                                          width: 3,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    color: Colors.transparent,
                                    child: Text(
                                      "OK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    onPressed: () {
                                      User.chk = 0;
                                      Navigator.pop(context);},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          });
    }

    return InkWell(
      child: Container(
        padding: EdgeInsets.only(right: 20),
        color: Colors.transparent,
        width: wt * 0.30,
        margin: const EdgeInsets.only(
          right: 20,
          bottom: 0,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: FadeInImage.assetNetwork(
                    width: wt * 0.25,
                    fadeInDuration: const Duration(seconds: 1),
                    fadeInCurve: Curves.bounceIn,
                    placeholder: 'assets/loading.png',
                    image: recipe.imagePath,
                    fit: BoxFit.fill,
                  ),
                  // Image.network(recipe.imagePath,
                  //   width: wt * 0.25, fit: BoxFit.fill),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        recipe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.white,
                          //color: Color(0xFFffc226),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Text(
                            "${recipe.kiloCaloriesBurnt}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              //color: Color(0xFFe83323),
                              color: Colors.white,
                              //color: Color(0xFF816df6),
                            ),
                          ),
                          Text(
                            " kcal",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              //color: Color(0xFFe83323),
                              color: Colors.white,
                              //color: Color(0xFF816df6),
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Icon(Icons.access_time,
                              color: /*Colors.whiteColor*/ Color(0xFFe83323),
                              size: 17),
                          Text(
                            "${recipe.timeTaken}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white,
                              //color: Color(0xFFde2e21),
                              //color: Color(0xFF12c444),
                            ),
                          ),
                          Text(
                            " mins",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              //color: Color(0xFFe83323),
                              color: Colors.white,
                              //color: Color(0xFF816df6),
                            ),
                          )
                        ],
                      ),
                      //SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RecipeDetailScreen(
                recip: recipe,
              );
            },
          ),
        );
        if (User.chk == 1) showCalLeft();
      },
    );
  }
}
