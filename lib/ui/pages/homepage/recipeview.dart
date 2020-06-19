import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/sampledata/recipe.dart';
import 'package:flutterdev/services/database.dart';
import 'package:flutterdev/ui/pages/homepage/user_home_screen.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recip;
  const RecipeDetailScreen({this.recip});
  
  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    
    return StreamBuilder<Datamod>(
        stream: DatabaseService(uid: user.uid).userspecfics,
        builder: (context, snapshot) {
          Datamod dum = snapshot.data;
          print("this is user caloriesdone: ${dum.caloriesdone}");
          //print("this is recipe kilocalorie burnt: ${recip.kiloCaloriesBurnt}");
          return Scaffold(
            backgroundColor: const Color(0xFFE9E9E9),
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  // snap: true,
                  // floating: true,
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.transparent,
                  expandedHeight: ht * 1 / 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40)),
                      child: FadeInImage.assetNetwork(
                        fadeInDuration: const Duration(seconds: 1),
                        fadeInCurve: Curves.bounceIn,
                        placeholder: 'assets/loading.png',
                        image: recip.imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: ListTile(
                          subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.access_time,
                              color: /*Colors.whiteColor*/ Color(0xFFe83323),
                              size: 17),
                          Text(
                            "${recip.timeTaken}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.black,
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
                              color: Colors.black,
                              //color: Color(0xFF816df6),
                            ),
                          )
                        ],
                      ),
                          title: Text(
                            recip.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          trailing: SizedBox(
                            height: 35,
                            child: FloatingActionButton.extended(
                              splashColor: Colors.white,
                              backgroundColor: Colors.red[900],
                              icon: Icon(
                                Icons.add_circle,
                              ),
                              onPressed: () async {
                                User.chk = 1;
                                await DatabaseService(uid: user.uid).updateUserData(
                                  name: dum.name,
                                  age: dum.age,
                                  weight: dum.weight,
                                  height: dum.height,
                                  activelevel: dum.activelevel,
                                  caloriesdone:(int.parse(recip.kiloCaloriesBurnt) +int.parse(dum.caloriesdone)).toString(),
                                  carbs: (int.parse(recip.carbs) + double.parse(dum.carbs)).toString(),
                                  fat: (int.parse(recip.fats) + double.parse(dum.fat)).toString(),
                                  gender: dum.gender,
                                  protein: (int.parse(recip.protein) +double.parse(dum.protein)).toString(),
                                  
                                );
                              Navigator.pop(context);
                              },
                              label: Text(
                                "Add to intake",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                backgroundColor: Colors.grey[200],
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                            children: [
                              TextSpan(
                                text: "${recip.kiloCaloriesBurnt} kcal",
                                style: TextStyle(
                                  color: Colors.red[900],
                                ),
                              ),
                              TextSpan(text: "\n"),
                              TextSpan(
                                text: "${recip.carbs}g carbs",
                                style: TextStyle(
                                  color: Color(0XFFffce47),
                                ),
                              ),
                              TextSpan(text: "\n"),
                              TextSpan(
                                text: "${recip.protein}g protein",
                                style: TextStyle(
                                  color: Color(0XFF52c748),
                                ),
                              ),
                              TextSpan(text: "\n"),
                              TextSpan(
                                text: "${recip.fats}g fats",
                                style: TextStyle(
                                  color: Color(0XFF30eaff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "INGREDIENTS",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.red[900],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            for (int i = 0; i < recip.ingredients.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  recip.ingredients[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage.assetNetwork(
                            fadeInDuration: const Duration(seconds: 1),
                            fadeInCurve: Curves.bounceIn,
                            placeholder: 'assets/loading.png',
                            image: recip.imageingre,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "PREPARATION",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 32),
                        child: Text(
                          recip.preparation,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            for (int i = 0; i < recip.image.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 6, top: 6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage.assetNetwork(
                                    fadeInDuration: const Duration(seconds: 1),
                                    fadeInCurve: Curves.bounceIn,
                                    placeholder: 'assets/loading.png',
                                    image: recip.image[i],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
