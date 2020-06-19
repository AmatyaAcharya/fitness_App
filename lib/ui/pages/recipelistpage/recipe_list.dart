import 'package:flutter/material.dart';
import 'package:flutterdev/sampledata/recipe.dart';
import 'package:flutterdev/ui/pages/homepage/recipe_prev.dart';
import 'package:flutterdev/ui/pages/homepage/saved_workout_gridview.dart';
import 'package:flutterdev/ui/pages/homepage/saved_workout_screen.dart';
import 'package:flutterdev/ui/pages/recipelistpage/recipe_page_card.dart';
import 'package:provider/provider.dart';
 class RecipeSection extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     final recip=Provider.of<List<Recipe>>(context)??[];
     return SafeArea(
       child: Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.grey[850],
            Colors.black87,
            
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
         child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                  primary: false,
                  padding: EdgeInsets.all(10),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  
                  children: <Widget>[
                    for ( var i in recip)
                      RecipePageCard(recipe:i),
                  ],
                ),
       ),
       
     );
   }
 }