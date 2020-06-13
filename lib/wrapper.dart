import 'package:flutter/material.dart';
import 'package:flutterdev/authenticate/authenticate.dart';
import 'package:flutterdev/profilepage/profilepage.dart';
import 'package:provider/provider.dart';
import 'package:flutterdev/authenticate/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    
     
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return ProfilePage();
    }
  }
}
