import 'package:flutter/material.dart';
import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/services/database.dart';
import 'package:provider/provider.dart';

class CalorieEdit extends StatefulWidget {
  @override
  _CalorieEditState createState() => _CalorieEditState();
}

class _CalorieEditState extends State<CalorieEdit> {
  String calories;
  String protein;
  String carbs;
  String fat;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Datamod dum =
        new Datamod(age: '', uid: '', name: '', height: '', weight: '');
    final userspecifics = Provider.of<Datamod>(context) ?? dum;
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.height;

    return Form(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: 'Add ',
                        style: TextStyle(color: Colors.red[800]),
                      ),
                      TextSpan(
                        text: 'Nutrition Values',
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text:
                            '**TO SEARCH FOR NUTRITION VALUES OF FOOD EATEN, INSTALL HELTHIFYME APP FROM GOOGLE PLAYSTORE',
                        style: TextStyle(fontSize: 10),
                      ),
                    ]),
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
                        borderSide:
                            BorderSide(color: Colors.red[900], width: 0.75),
                        borderRadius: BorderRadius.circular(40)),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.red[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                    hintText: "Calories consumed(gms)"),
                onChanged: (val) {
                  setState(() => calories = val);
                },
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
                      onChanged: (val) {
                  setState(() => carbs = val);
                },
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
                      onChanged: (val) {
                  setState(() => protein = val);
                },
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
                      onChanged: (val) {
                  setState(() => fat = val);
                },
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
                    onPressed: () async{
                      print(calories);
                      print(fat);
                      print(protein);
                      print(carbs);
                      await DatabaseService(uid: user.uid).updateUserData(
                      name: userspecifics.name,
                        age: userspecifics.age,
                        weight: userspecifics.weight,
                        height: userspecifics.height,
                        activelevel: userspecifics.activelevel,
                        caloriesdone: (int.parse(calories)+int.parse(userspecifics.caloriesdone)).toString() ??userspecifics.caloriesdone,
                        carbs: (double.parse(carbs)+double.parse(userspecifics.carbs)).toString()??userspecifics.carbs,
                        fat: (double.parse(fat)+double.parse(userspecifics.fat)).toString()??userspecifics.fat,
                        protein: (double.parse(fat)+double.parse(userspecifics.fat)).toString()??userspecifics.protein,
                        gender: userspecifics.gender,
                        
                        );
                      Navigator.of(context).pop();
                    }),
            ]),
      ),
    );
  }
}
