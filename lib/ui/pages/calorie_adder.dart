import 'dart:ui';

import 'package:flutter/material.dart';

class CalorieAdder {
  calorieDialog(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.width;
    return showDialog(
        context: context,
        builder: (context) {
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
              /*title: Text(
                "NUTRITION VALUES OF FOOD EATEN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),*/
              content: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0),
                  height: ht,
                  width: wt,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Title(
                          color: Colors.white,
                          child: Text(
                            "NUTRITION VALUES OF FOOD EATEN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.red[900]),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red[900], width: 0.75),
                                  borderRadius: BorderRadius.circular(40)),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              hintText: "Calories consumed(gms)"),
                        ),
                        SizedBox(height: 22),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFFffce47)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0XFFffce47), width: 0.75),
                                  borderRadius: BorderRadius.circular(40)),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Color(0XFFffce47),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              hintText: "Carbs consumed(gms)"),
                        ),
                        SizedBox(height: 22),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFF52c748)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0XFF52c748), width: 0.75),
                                  borderRadius: BorderRadius.circular(40)),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Color(0XFF52c748),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              hintText: "Protein consumed(gms)"),
                        ),
                        SizedBox(height: 22),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFF30eaff)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0XFF30eaff), width: 0.75),
                                  borderRadius: BorderRadius.circular(40)),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Color(0XFF2edef2),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              hintText: "Fats consumed(gms)"),
                        ),
                        SizedBox(height: 42),
                        IconButton(
                            highlightColor: Colors.transparent,
                            iconSize: 45,
                            color: Colors.white,
                            splashColor: Colors.red[900],
                            icon: Icon(
                              Icons.add_circle,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
