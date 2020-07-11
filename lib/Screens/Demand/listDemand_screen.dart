import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/models/offre.dart';
import 'package:student_coloco_ghoulami/models/room.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';

import 'componenets/popular_place_card.dart';
import 'componenets/recomended_card.dart';

class ListOffer extends StatefulWidget {
  @override
  _ListOfferState createState() => _ListOfferState();
}

class _ListOfferState extends State<ListOffer> {
  String dropdownBeds = '2-4 Beds';
  String dropdownFilter = 'Short by: Price';
  final databaseReference = Firestore.instance;
  List<Offre> offers = List<Offre>();

  Future<QuerySnapshot> getData() async {
    return await databaseReference.collection("Offers").getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    getData().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((offre) {
        this.offers.add(new Offre.fromJson(offre.data));
      });
    });

    print(offers.length);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("${new DateTime.now().day} / ${new DateTime.now().month} / ${new DateTime.now().year}",
                  style: kSubtitleStyle.copyWith(height: 2.0),
                ),
                subtitle: Text(
                  "Find your rant",
                  style: kTitleStyle.copyWith(height: 1.5),
                ),
                trailing: Icon(Icons.notifications, color: kBlack),
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 25.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: DropdownButton(
                      value: dropdownBeds,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.0,
                        color: kBlack.withOpacity(.5),
                      ),
                      underline: Container(),
                      onChanged: (String beds) {
                        setState(() {
                          dropdownBeds = beds;
                        });
                      },
                      items: ["2-4 Beds", "2 Beds", "3 Beds", "4 Beds"]
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: DropdownButton(
                      value: dropdownFilter,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.0,
                        color: kBlack.withOpacity(.5),
                      ),
                      underline: Container(),
                      onChanged: (String beds) {
                        setState(() {
                          dropdownFilter = beds;
                        });
                      },
                      items: [
                        "Short by: Price",
                        "Short by: Name",
                        "Short by: Location",
                        "Short by: Type",
                      ]
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                height: 340.0,
                child: ListView.builder(
                  itemCount: roomList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var room = roomList[index];
                    return RecommendedCard(room: room);
                  },
                ),
              ),
              SizedBox(height: 15.0),
              ListTile(
                title: Text("All Place", style: kTitleStyle),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('Offers').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) return CircularProgressIndicator();
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            var offre = snapshot.data.documents[index];
                            return PopularPlaceCard(offre: offre);
                          });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
