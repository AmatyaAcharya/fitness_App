import 'package:flutter/material.dart';
import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/services/auth.dart';
import 'package:flutterdev/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  String logout = "logout";
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    final userspecifics = Provider.of<List<Datamod>>(context);
    //print("user id milgaya ${user.uid}");
    userspecifics.removeWhere((element) => element==null);
    // print("users ki details $userspecifics");
    // print(userspecifics[0].age);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[850], Colors.black87],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: 'User ',
                  ),
                  TextSpan(
                    text: 'Details',
                    style: TextStyle(color: Colors.red[800]),
                  ),
                ]),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  (Icons.close),
                  color: Colors.white,
                  semanticLabel: logout,
                ),
                onPressed: () async {
                  await _auth.signOut();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
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
                "${userspecifics[0].name}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0),
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
                "${userspecifics[0].weight}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0),
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
                "${userspecifics[0].height}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0),
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
                "${userspecifics[0].age}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
