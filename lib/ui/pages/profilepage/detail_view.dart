import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterdev/Models/datamod.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Datamod dum =
        new Datamod(age: '', uid: '', name: '', height: '', weight: '');
    final userspecifics = Provider.of<Datamod>(context) ?? dum;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/user.jpg'),
            ),
          ),
          Divider(
            color: Colors.grey[800],
            height: 50.0,
          ),
          Text(
            'NAME',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            "${userspecifics.name}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Weight',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "${userspecifics.weight}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
              ),
              TextSpan(
                  text: " Kgs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ))
            ]),
          ),

          SizedBox(height: 10.0),
          Text(
            'Height',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "${userspecifics.height}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
              ),
              TextSpan(
                  text: " cms",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ))
            ]),
          ),

          SizedBox(height: 10.0),
          Text(
            'Age',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(width: 10.0),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "${userspecifics.age}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                ),
              ),
              TextSpan(
                  text: " yrs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ))
            ]),
          ),
          SizedBox(height: 10.0),
          Text(
            'Daily Calorie Intake',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          //SizedBox(width: 10.0),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "${userspecifics.calories}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                ),
              ),
              TextSpan(
                  text: " Kcals",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ))
            ]),
          ),
          SizedBox(height: 10.0),
          Text(
            'BMI',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "${userspecifics.bmi}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
              letterSpacing: 2.0,
            ),
              ),
              if(double.parse(userspecifics.bmi)>=25.0)
              TextSpan(
                  text: ": OverWeight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ))
                  else if(double.parse(userspecifics.bmi)<=18.4)
                  TextSpan(
                  text: ": UnderWeight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ))
                  else
                  TextSpan(
                  text: ": Healthy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  )),
                 TextSpan(text:'\n'),
                 TextSpan(text:'\n'),
                  TextSpan(
                  text: "**a healthy range is between 18.5 to 24.9",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                  ))
            ]),
          ),
          
        ],
      ),
    );
  }
}
