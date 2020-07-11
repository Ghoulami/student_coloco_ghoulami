import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/Screens/Demand/addDemand_screen.dart';
import 'package:student_coloco_ghoulami/Screens/Offre/addOffre_screen.dart';
import 'package:student_coloco_ghoulami/Screens/Offre/listOffre_screen.dart';
import 'package:student_coloco_ghoulami/Services/auth.dart';
import 'package:student_coloco_ghoulami/components/loading.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';
import 'components/Item_Card.dart';
import 'components/my_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double offset = 0;
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children : <Widget>[
            MyHeader(
              image: "assets/images/usms.png",
              offset: offset,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: ItemCard(
                        image: "assets/icons/rental.svg",
                        title: "Add offer",
                        color: kIconsColor,
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddOfferScreen();
                            },
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: ItemCard(
                        image: "assets/icons/list_offre.svg",
                        title: "List offers",
                        color: kIconsColor,
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddDemandScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: ItemCard(
                        image: "assets/icons/demand.svg",
                        title: "Add demand",
                        color: kIconsColor,
                      ),
                      onTap: (){},
                    ),
                    InkWell(
                      child: ItemCard(
                        image: "assets/icons/list_demand.svg",
                        title: "List demands",
                        color: kIconsColor,
                      ),
                        onTap: () {

                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: ItemCard(
                        image: "assets/icons/logout.svg",
                        title: "Log Out",
                        color: kIconsColor,
                      ),
                      onTap: () async{
                        setState(() => loading = true);
                        await _auth.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}
