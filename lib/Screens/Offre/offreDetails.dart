import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';
import 'componenets/SizeConfig.dart';

class OffreDetails extends StatefulWidget {
  final DocumentSnapshot offre;

  const OffreDetails({Key key, this.offre}) : super(key: key);

  @override
  _OffreDetailsState createState() => _OffreDetailsState();
}

class _OffreDetailsState extends State<OffreDetails> {
  List<FacilityCard> facilities = [
    FacilityCard(asset: "assets/images/router.png",name: "Wifi" , param:"wifi" ,),
    FacilityCard(asset:"assets/images/clothes.png", name: "Laundry",param:"lave_ligne" ,),
    FacilityCard(asset:"assets/images/bus.png", name: "Bus",param: "bus",),
    FacilityCard(asset:"assets/images/tray.png", name: "Food",param:"food" ,),
    FacilityCard(asset:"assets/images/gym.png", name: "Gym",param:"gym" ,),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: 3 * SizeConfig.widthMultiplier
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5 * SizeConfig.heightMultiplier,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height: 40 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(widget.offre["images"][index]),
                                  fit: BoxFit.cover)
                          ),
                        ),
                      ),
                      separatorBuilder: (context,index)=>SizedBox(width: 8,),
                      itemCount: widget.offre["images"].length,
                    )
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                Text("Our Place : "+widget.offre["title"], style: TextStyle(
                    color: Colors.black,
                    fontSize: 3 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                Text("Adress :"+widget.offre["adresse"], style: TextStyle(
                    color: kBodyTextColor,
                    fontSize: 3.1 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 1 * SizeConfig.heightMultiplier,),
                Text("Capacite : "+widget.offre["capacite"].toString() + " Person", style: TextStyle(
                  color: kBodyTextColor,
                  fontSize: 3.1 * SizeConfig.textMultiplier,
                ),),
                Text("Superficie : "+widget.offre["superficie"].toString() + " M²", style: TextStyle(
                  color: kBodyTextColor,
                  fontSize: 3.1 * SizeConfig.textMultiplier,
                ),),
                Text("Date : "+(widget.offre["data"].toDate()).toString(), style: TextStyle(
                  color: kBodyTextColor,
                  fontSize: 3.1 * SizeConfig.textMultiplier,
                ),),
                Text("Phone : "+widget.offre["phone_number"], style: TextStyle(
                  color: kBodyTextColor,
                  fontSize: 3.1 * SizeConfig.textMultiplier,
                ),),
                SizedBox(height: 1 * SizeConfig.heightMultiplier,),
                Text("Facilities", style: TextStyle(
                    color: Colors.black,
                    fontSize: 2.5 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: widget.offre[this.facilities[index].param]? this.facilities[index]:VerticalDivider(width: 0,),
                      ),
                      separatorBuilder: (context,index)=>SizedBox(width: 8,),
                      itemCount:this.facilities.length,
                    )
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _facilityCard("assets/images/router.png", "Wifi"),
                    _facilityCard("assets/images/bus.png", "Bus"),
                    _facilityCard("assets/images/tray.png", "Food"),
                    _facilityCard("assets/images/gym.png", "Gym"),
                    _facilityCard("assets/images/heater.png", "laundry"),
                  ],
                ),*/
                SizedBox(height: 3 * SizeConfig.heightMultiplier,),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            vertical: 2 * SizeConfig.heightMultiplier,
                            horizontal: 4 * SizeConfig.widthMultiplier
                        ),
                        child: Row(
                          children: <Widget>[
                            Text("Call me", style: TextStyle(
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.w600
                            ),),                            SizedBox(width: 3 * SizeConfig.widthMultiplier,),
                            Icon(Icons.phone_android, color: kBodyTextColor, size: 4 * SizeConfig.imageSizeMultiplier,),                            SizedBox(width: 3 * SizeConfig.widthMultiplier,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 3 * SizeConfig.widthMultiplier,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: 2 * SizeConfig.heightMultiplier,
                              horizontal: 4 * SizeConfig.widthMultiplier
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Price", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),),
                              Text("MAD "+widget.offre["prix"].toString(), style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),


        );
      });
    });

  }

}

class FacilityCard extends StatelessWidget {
  final String asset;
  final String name;
  final String param;
  const FacilityCard({Key key, this.asset, this.name, this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
            vertical: 1 * SizeConfig.heightMultiplier,
            horizontal: 4 * SizeConfig.widthMultiplier
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(asset, height: 10 * SizeConfig.imageSizeMultiplier, width: 10 * SizeConfig.imageSizeMultiplier,),
            SizedBox(height: 1 * SizeConfig.heightMultiplier,),
            Text(name, style: TextStyle(
                fontSize: 1.4 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.w600
            ),)
          ],
        ),
      ),
    );
  }
}
