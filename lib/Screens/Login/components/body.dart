import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_coloco_ghoulami/Screens/Signup/signup_screen.dart';
import 'package:student_coloco_ghoulami/Services/auth.dart';
import 'package:student_coloco_ghoulami/components/already_have_an_account_acheck.dart';
import 'package:student_coloco_ghoulami/components/loading.dart';
import 'package:student_coloco_ghoulami/components/rounded_button.dart';
import 'package:student_coloco_ghoulami/components/rounded_input_field.dart';
import 'package:student_coloco_ghoulami/components/rounded_password_field.dart';

import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String _password, _email;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? Loading() :Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundedInputField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    hintText: "Your Email",
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  PasswordField(
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (input) {
                      _password = input;
                    },
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(_email, _password);
                        if(result == null) {
                          setState(() {
                          error = 'Could not sign in with those credentials';
                          loading = false;
                        });
                        }
                      }
                      Navigator.of(context).pop();
                    }
                  ),
                  RoundedButton(
                    text: "LOGIN ANONYMOUSLY",
                    press: () async {
                      setState(() => loading = false);
                      dynamic result = await _auth.signInAnon();
                      if(result == null){
                        print('error signing in');
                      } else {
                        print('signed in');
                        setState(() => loading = true);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
