import 'package:flutter/material.dart';
import 'package:flutterdev/Models/datamod.dart';
import 'package:flutterdev/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutterdev/authenticate/user.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  String weight;
  String height;
  String age;
  String activelevel;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Datamod dum =
        new Datamod(age: '', uid: '', name: '', height: '', weight: '');
    final userspecifics = Provider.of<Datamod>(context) ?? dum;
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Title(
              color: Colors.white,
              child: Text(
                "Change Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black45,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.75),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  hintText: "Enter updated weight(in kgs)"),
              validator: (val) => val.length > 3 || val.length < 2
                  ? 'Enter correct weight'
                  : null,
              onChanged: (val) {
                setState(() => weight = val);
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black45,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.75),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  hintText: "Enter updated height(in cms)"),
              validator: (val) =>
                  val.length != 3 ? 'Enter correct height' : null,
              onChanged: (val) {
                setState(() => height = val);
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black45,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.75),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  hintText: "Enter age"),
              validator: (val) => int.parse(val) > 100 || int.parse(val) < 10
                  ? 'Enter correct age'
                  : null,
              onChanged: (val) {
                setState(() => age = val);
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black45,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.75),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  hintText: "Change your activity level on a scale of 1-7"),
              validator: (val) => int.parse(val) > 7 || int.parse(val) < 1
                  ? 'Enter correct level'
                  : null,
              onChanged: (val) {
                setState(() => activelevel = val);
              },
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: wt * 1 / 4,
              height: ht * 1 / 17,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red[800],
                child: Text(
                  'Update',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await DatabaseService(uid: user.uid).updateUserData(
                        name: userspecifics.name,
                        age: age ?? userspecifics.age,
                        weight: weight ?? userspecifics.weight,
                        height: height ?? userspecifics.height,
                        activelevel: activelevel?? userspecifics.activelevel,
                        caloriesdone: userspecifics.caloriesdone,
                        carbs: userspecifics.carbs,
                        fat: userspecifics.fat,
                        gender: userspecifics.gender,
                        protein: userspecifics.protein,
                        );
                        


                    Navigator.pop(context);
                  }
                },
                // onPressed: () async {
                //   if (_formKey.currentState.validate()) {
                //     setState(() => loading = true);
                //     dynamic result = await _auth.registerWithEmailAndPassword(
                //         widget.email, password, "72");
                //     if (result == null) {
                //       setState(
                //         () {
                //           loading = false;
                //           error = 'Please supply a valid email';
                //         },
                //       );
                //     }
                //   }
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
