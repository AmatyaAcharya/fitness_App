import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterdev/Models/datamod.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   Datamod dum= new Datamod(age: '',uid: '',name: '',height: '',weight: '');
    final userspecifics = Provider.of<Datamod>(context)??dum;
    //userspecifics.removeWhere((element) => element == null);
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
            height: 60.0,
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
          SizedBox(height: 10.0),
          Text(
            "${userspecifics.name}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Weight',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "${userspecifics.weight}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30.0,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Height',
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "${userspecifics.height}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30.0,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 20.0),
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
          Text(
            "${userspecifics.age}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
