import 'package:flutter/material.dart';
import 'package:flutterdev/Shared/loading.dart';
import 'package:flutterdev/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wt = MediaQuery.of(context).size.height;
    return loading? Loading() : SafeArea(
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
                      "LOGIN IN",
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
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.75),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                        hintText: "Enter registered Email ID"),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
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
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.75),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                        hintText: "Enter password"),
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: wt * 1 / 4.5,
                    height: ht * 1 / 17.5,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red[800],
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error =
                                    'Could not sign in with those credentials';
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
                    "Don't have an account yet?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: wt * 1 / 4.5,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.red[800],
                      child: Text(
                        'Register Now!',
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
