import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/Services/auth.dart';
import 'package:student_coloco_ghoulami/Services/demand_service.dart';
import 'package:student_coloco_ghoulami/Services/user_service.dart';
import 'package:student_coloco_ghoulami/components/loading.dart';
import 'package:student_coloco_ghoulami/components/rounded_button.dart';
import 'package:student_coloco_ghoulami/components/rounded_input_field.dart';
import 'package:student_coloco_ghoulami/models/demand.dart';
import '../listDemand_screen.dart';
import 'background.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  Demand demand = Demand();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    UserServices().getUserId().then((value) {
      setState(() {
        demand.owner = value;
      });
    });
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Background(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Add Demand",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          RoundedInputField(
                            hintText: "Title",
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the Title' : null,
                            icon: Icons.title,
                            onChanged: (value) {
                              demand.title = value;
                            },
                          ),
                          RoundedInputField(
                            hintText: "Adresse",
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the Adresse' : null,
                            icon: Icons.location_on,
                            onChanged: (value) {
                              demand.adresse = value;
                            },
                          ),
                          RoundedInputField(
                            hintText: "Description",
                            validator: (val) => val.isEmpty
                                ? 'Please enter the Superficie'
                                : null,
                            icon: Icons.text_fields,
                            onChanged: (value) {
                              demand.description = value;
                            },
                          ),
                          RoundedInputField(
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the Price' : null,
                            hintText: "Maximal bedget",
                            icon: Icons.attach_money,
                            onChanged: (value) {
                              demand.max_budget = double.parse(value);
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                          RoundedInputField(
                            validator: (val) => val.isEmpty
                                ? 'Please entre a Phone number'
                                : null,
                            hintText: "Phone",
                            icon: Icons.phone_android,
                            onChanged: (value) {
                              demand.phone_number = value;
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                          RoundedButton(
                            text: "Submit",
                            press: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                await DemandService()
                                    .addDemandData(demand)
                                    .then((value) {
                                  if (value == null) {
                                    setState(() {
                                      error = 'Please supply a valid data';
                                      loading = false;
                                    });
                                  }
                                });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListDemand()));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
