import 'package:flutter/material.dart';
import 'package:flutterdev/Shared/loading.dart';

import 'package:flutterdev/services/auth.dart';

class Register extends StatefulWidget {
  String email = '';
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  // text field state
  String name;
  String weight;
  String height;
  String age;
  String activelevel;
  String gender;
  String password = '';
  //String ages='0';


  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.height;
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              body: Container(
                alignment: Alignment.center,
                height: ht,
                width: wt,
                //color: Colors.black87,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black87,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                padding: EdgeInsets.symmetric(
                    horizontal: wt * 1 / 20, vertical: ht * 1 / 20),
                child: Form(
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
                            "REGISTER WITH US",
                            style: TextStyle(
                                color: Colors.red[800],
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText: "Enter a valid Email ID"),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => widget.email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText: "Enter a new password"),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ characters long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText: "Enter Name"),
                          validator: (val) => val.isEmpty ? 'Enter name' : null,
                          onChanged: (val) {
                            setState(() => name = val);
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
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText: "Enter weight(in kgs)"),
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
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText: "Enter height(in cms)"),
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
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText: "Enter age"),
                          validator: (val) =>
                              int.parse(val) > 100 || int.parse(val) < 10
                                  ? 'Enter correct age'
                                  : null,
                          onChanged: (val) {
                            setState(() => age = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black45,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText: "Enter gender, M(male) or F(female)"),
                          validator: (val) => val.length > 1 || val.isEmpty
                              ? 'Enter correct initial'
                              : null,
                          onChanged: (val) {
                            setState(() => gender = val);
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
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.75),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              hintText:
                                  "Rate your activity level on a scale of 1-7"),
                          validator: (val) =>
                              int.parse(val) > 7 || int.parse(val) < 1
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
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email: widget.email,
                                          password: password,
                                          name: name,
                                          height: height,
                                          weight: weight,
                                          age: age,
                                          activelevel: activelevel,
                                          gender: gender);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'Please enter valid credentials';
                                    });
                                  }
                                }
                              }),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Already Registered?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: wt * 1 / 5,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.red[800],
                            child: Text(
                              'Sign In Now!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () => widget.toggleView(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
