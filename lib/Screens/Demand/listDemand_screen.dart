import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/models/demand.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';
import 'componenets/popular_place_card.dart';

class ListDemand extends StatefulWidget {
  @override
  _ListDemandState createState() => _ListDemandState();
}

class _ListDemandState extends State<ListDemand> {
  final databaseReference = Firestore.instance;
  List<Demand> demands = List<Demand>();



  @override
  Widget build(BuildContext context) {
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
                  "All Demands",
                  style: kTitleStyle.copyWith(height: 1.5),
                ),
                trailing: Icon(Icons.help_outline, color: kBlack),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('Demands').snapshots(),
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
                            var demand = snapshot.data.documents[index];
                            return PopularPlaceCard(demand: demand);
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
