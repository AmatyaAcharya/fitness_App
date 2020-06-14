import 'package:flutter/material.dart';
import 'package:flutterdev/authenticate/auth.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  String logout = "logout";
  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(fontSize: 27, fontWeight:FontWeight.w400),
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
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Chun-Li',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'HOMETOWN',
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Beijing, China',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'CURRENT NINJA LEVEL',
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '8',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.red[800],
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'chun.li@thenetninja.co.uk',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
