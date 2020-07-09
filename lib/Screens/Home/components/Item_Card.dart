import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';

class ItemCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;

  const ItemCard({
    Key key,
    this.image,
    this.title,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2.5,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(image , height: 50,color: color,),
            SizedBox(height: 20,),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}