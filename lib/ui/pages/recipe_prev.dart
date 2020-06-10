import "package:flutter/material.dart";
import 'package:flutterdev/sampledata/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({this.recipe});

  @override
  Widget build(BuildContext context) {
    final wt = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(right: 20),
      color: Colors.transparent,
      width: wt * 0.30,
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
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
                child: Image.asset(recipe.imagePath,
                    width: wt * 0.25, fit: BoxFit.fill),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      recipe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
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
                        Text(" kcal",style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            //color: Color(0xFFe83323),
                            color: Colors.white,
                            //color: Color(0xFF816df6),
                          ), )
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
                        Text(" mins", style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            //color: Color(0xFFe83323),
                            color: Colors.white,
                            //color: Color(0xFF816df6),
                          ), )
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
    );
  }
}
