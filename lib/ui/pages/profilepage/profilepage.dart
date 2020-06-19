import 'package:flutter/material.dart';
import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/authenticate/user.dart';
import 'package:flutterdev/services/auth.dart';
import 'package:flutterdev/services/database.dart';
import 'package:flutterdev/ui/pages/profilepage/detail_view.dart';
import 'package:flutterdev/ui/pages/profilepage/settings_form.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  String logout = "logout";
  @override
  Widget build(BuildContext context) {
    // final double ht = MediaQuery.of(context) .size.height;
    // final double wt = MediaQuery.of(context).size.height;
    final user = Provider.of<User>(context);
    Datamod dum =
        new Datamod(age: '', uid: '', name: '', height: '', weight: '');
    final userspecifics = Provider.of<Datamod>(context) ?? dum;
    print(userspecifics.name);
    print(userspecifics.uid);
    // print(userspecifics.age);
    //userspecifics.removeWhere((element) => element == null);
    //print("user id milgaya ${user.uid}");
    // print("users ki details $userspecifics");
    // print(userspecifics[0].age);
    void showSettingsPanel() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return StreamProvider<Datamod>.value(
              value: DatabaseService(uid: user.uid).userspecfics,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30),
                    topRight: const Radius.circular(30),
                  ),
                  child: Container(
                    //color: Colors.black,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey[850],
                          Colors.black87,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SettingsForm(),
                    ),
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
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
        leading: IconButton(
            icon: Icon(
              (Icons.settings),
              color: Colors.white,
            ),
            onPressed: () => showSettingsPanel()),
        actions: <Widget>[
          FlatButton.icon(
              label: Text(
                'logout',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                (Icons.close),
                color: Colors.white,
              ),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: DetailView(),
      ),
    );
  }
}
