import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_coloco_ghoulami/Screens/Login/login_screen.dart';
import 'package:student_coloco_ghoulami/Services/auth.dart';
import 'package:student_coloco_ghoulami/Services/user_service.dart';
import 'package:student_coloco_ghoulami/components/already_have_an_account_acheck.dart';
import 'package:student_coloco_ghoulami/components/loading.dart';
import 'package:student_coloco_ghoulami/components/rounded_button.dart';
import 'package:student_coloco_ghoulami/components/rounded_input_field.dart';
import 'package:student_coloco_ghoulami/components/rounded_password_field.dart';
import 'package:student_coloco_ghoulami/models/user.dart';
import 'background.dart';
import 'or_divider.dart';

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
  User user = User();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? Loading() : Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundedInputField(
                    hintText: "Your Last Name",
                    validator: (val) => val.isEmpty ? 'Enter a last name' : null,
                    onChanged: (value) {
                      user.last_name = value;
                    },
                  ),
                  RoundedInputField(
                    hintText: "Your Fisrt Name",
                    validator: (val) => val.isEmpty ? 'Enter a fisrt name' : null,
                    onChanged: (value) {
                      user.fist_name = value;
                    },
                  ),
                  RoundedInputField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    hintText: "Your Email",
                    onChanged: (value) {
                      user.email = value;
                    },
                  ),
                  PasswordField(
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (input) {
                      user.password = input;
                    },
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(user.email.trim(), user.password);

                        await UserServices(uid: result.uid).addUserData(user);

                        if(result == null) {
                          setState(() {
                            error = 'Please supply a valid data';
                            loading = false;
                          });
                        }
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            OrDivider(),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
