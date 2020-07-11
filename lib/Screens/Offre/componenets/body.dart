import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/Services/auth.dart';
import 'package:student_coloco_ghoulami/Services/offre_service.dart';
import 'package:student_coloco_ghoulami/Services/user_service.dart';
import 'package:student_coloco_ghoulami/components/loading.dart';
import 'package:student_coloco_ghoulami/components/rounded_button.dart';
import 'package:student_coloco_ghoulami/components/rounded_input_field.dart';
import 'package:student_coloco_ghoulami/models/offre.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';
import '../listOffre_screen.dart';
import 'background.dart';
import 'facilities_divider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  Offre offre = Offre();
  bool loading = false;
  List<Asset> images = List<Asset>();
  List<String> imagesUri = List<String>();
  bool done = false;

  @override
  Widget build(BuildContext context) {
    UserServices().getUserId().then((value){
      setState(() {
        offre.owner = value;
      });
    });
    Size size = MediaQuery.of(context).size;
    return loading ? Loading():Background(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Add Offer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          RoundedInputField(
                            hintText: "Title",
                            validator: (val) => val.isEmpty ? 'Please enter the Title' : null,
                            icon: Icons.title,
                            onChanged: (value) {
                              offre.title = value;
                            },
                          ),
                          RoundedInputField(
                            hintText: "Adresse",
                            validator: (val) => val.isEmpty ? 'Please enter the Adresse' : null,
                            icon: Icons.location_on,
                            onChanged: (value) {
                              offre.adresse= value;
                            },
                          ),
                          RoundedInputField(
                            hintText: "Superficie",
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the Superficie' : null,
                            icon: Icons.border_clear,
                            onChanged: (value) {
                              offre.superficie = double.parse(value);
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                          RoundedInputField(
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the Price' : null,
                            hintText: "Price",
                            onChanged: (value) {
                              offre.prix = double.parse(value);
                            },
                            icon: Icons.attach_money,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                          RoundedInputField(
                            validator: (val) =>
                                val.isEmpty ? 'Please enter the capacité' : null,
                            hintText: "capacité",
                            icon: Icons.face,
                            onChanged: (value) {
                              offre.capacite = int.parse(value);
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                          RoundedInputField(
                            validator: (val) =>
                                val.isEmpty ? 'Please entre a Phone number' : null,
                            hintText: "Phone",
                            icon: Icons.phone_android,
                            onChanged: (value) {
                              offre.phone_number = value;
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                          FacilitiesDivider(
                            text: "Facilities",
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CheckboxListTile(
                                      title: Text("Food"),
                                      value: offre.food,
                                      activeColor: kPrimaryColor,
                                      checkColor: kPrimaryLightColor,
                                      onChanged: (bool value) {
                                        setState(() {
                                          offre.food = value;
                                          print(offre.food,);
                                        });
                                      },
                                      selected: offre.food,
                                      secondary: Icon(Icons.fastfood),
                                      controlAffinity:
                                      ListTileControlAffinity.trailing,
                                    ),
                                    CheckboxListTile(
                                      title: Text("Gym"),
                                      value: offre.gym,
                                      activeColor: kPrimaryColor,
                                      checkColor: kPrimaryLightColor,
                                      onChanged: (bool value) {
                                        setState(() {
                                          offre.gym = value;
                                          print(offre.gym,);
                                        });
                                      },
                                      selected: offre.gym,
                                      secondary: Icon(Icons.fitness_center,),
                                      controlAffinity:
                                      ListTileControlAffinity.trailing,
                                    ),
                                    CheckboxListTile(
                                      title: Text("Bus"),
                                      value: offre.bus,
                                      activeColor: kPrimaryColor,
                                      checkColor: kPrimaryLightColor,
                                      onChanged: (bool value) {
                                        setState(() {
                                          offre.bus = value;
                                          print(offre.bus);
                                        });
                                      },
                                      selected: offre.bus,
                                      secondary: Icon(Icons.directions_bus),
                                      controlAffinity:
                                      ListTileControlAffinity.trailing,
                                    ),

                                  ],
                                ),
                              ),
                              VerticalDivider(
                                  color: Color(0xFFD9D9D9), width: 0),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CheckboxListTile(
                                      title: Text("WiFi"),
                                      value: offre.wifi,
                                      activeColor: kPrimaryColor,
                                      checkColor: kPrimaryLightColor,
                                      onChanged: (bool value) {
                                        setState(() {
                                          offre.wifi = value;
                                          print(offre.wifi);
                                        });
                                      },
                                      selected: offre.wifi,
                                      secondary: Icon(Icons.wifi),
                                      controlAffinity:
                                      ListTileControlAffinity.trailing,
                                    ),
                                    CheckboxListTile(
                                      title: Text("Laundry"),
                                      value: offre.lave_ligne,
                                      activeColor: kPrimaryColor,
                                      checkColor: kPrimaryLightColor,
                                      onChanged: (bool value) {
                                        setState(() {
                                          offre.lave_ligne = value;
                                          print(offre.lave_ligne);
                                        });
                                      },
                                      selected: offre.lave_ligne,
                                      secondary: Icon(Icons.toys),
                                      controlAffinity:
                                      ListTileControlAffinity.trailing,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FacilitiesDivider(
                            text: "pictures",
                          ),
                          RoundedButton(
                            text: "Pick images",
                            press: loadAssets,
                          ),
                          images.length==0 ?SizedBox(
                            height: 0,
                          ):SizedBox(
                            height: 150.0,
                            child: buildGridView(),
                          ),
                          FacilitiesDivider(
                            text: "Location",
                          ),
                          done ? RoundedButton(
                            text: "Submit",
                            press: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                await OffreServices().addOffreData(offre , imagesUri).then((value){
                                  if (value == null) {
                                    setState(() {
                                      error = 'Please supply a valid data';
                                      loading = false;
                                    });
                                  }
                                });
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ListOffer()));
                              }
                            },
                          ):CircularProgressIndicator()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Pick images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      images.forEach((element) {
        OffreServices().uploadPic(element).then((value){
          if(value != null){
            print(value);
            imagesUri.add(value);
            if (element == images.last){
              this.done = true;
            }
          }
        });
      });
    });
  }
}
