import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';
import '../demandDetails.dart';

class PopularPlaceCard extends StatelessWidget {
  final DocumentSnapshot demand;
  PopularPlaceCard({ this.demand});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 110.0,
        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 110.0,
              height: 110.0,
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 12.0,
                    bottom: 12.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        "assets/images/rent_image/1_h123kc.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child: Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: kBlue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(demand["title"], style: kTitleStyle, maxLines: 1),
                    Text(demand["adresse"], style: kSubtitleStyle),
                    Row(
                      children: <Widget>[
                        Text(
                          (demand["date"].toDate()).toString(),
                          maxLines: 1,
                          style: kSubtitleStyle.copyWith(
                            color: kBlack.withOpacity(1.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DemandDetails(demand: this.demand);
            },
          ),
        );
      },
    );
  }
}
