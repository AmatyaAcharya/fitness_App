import 'package:flutter/material.dart';
import 'package:flutterdev/authenticate/authenticate.dart';
import 'package:flutterdev/services/database.dart';
//import 'package:flutterdev/services/auth.dart';
import 'package:flutterdev/ui/pages/home_screen.dart';
//import 'package:flutterdev/profilepage/profilepage.dart';
//import 'package:flutterdev/ui/pages/profilepage/profilepage.dart';
import 'package:provider/provider.dart';
import 'package:flutterdev/authenticate/user.dart';
//import 'package:flutterdev/authenticate/register.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user.uid);
   
     
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } 
    //else if(AuthService.check==1)
    else if(user.ch==1)
    {
    DatabaseService.ud=user.uid;
    return HomeScreen(2);
    }
    else 
    {
    DatabaseService.ud=user.uid;
    return HomeScreen(0);
    }
  }
}
