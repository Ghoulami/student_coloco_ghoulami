import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/Services/demand_service.dart';
import 'package:student_coloco_ghoulami/util/constants.dart';
import '../../Services/auth.dart';
import '../../Services/user_service.dart';
import 'componenets/SizeConfig.dart';
import 'listDemand_screen.dart';

class DemandDetails extends StatefulWidget {
  final DocumentSnapshot demand;

  const DemandDetails({Key key, this.demand}) : super(key: key);

  @override
  _DemandDetailsState createState() => _DemandDetailsState();
}

class _DemandDetailsState extends State<DemandDetails> {
   String auth = '';

  @override
  Widget build(BuildContext context) {
    UserServices().getUserId().then((value) {
      setState(() {
        auth = value;
      });
    });

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
                Center(
                  child: Text("Demand's Details", style: TextStyle(
                      color: Colors.black,
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w600
                  ),),
                ),
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
                              image: DecorationImage(image: AssetImage("assets/images/rent_image/1_h123kc.jpg"))
                          ),
                        ),
                      ),
                      separatorBuilder: (context,index)=>SizedBox(width: 8,),
                      itemCount: 1,
                    )
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                Text("Title : "+widget.demand["title"], style: TextStyle(
                    color: Colors.black,
                    fontSize: 3 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                Text("Adress :"+widget.demand["adresse"], style: TextStyle(
                    color: kBodyTextColor,
                    fontSize: 3.1 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 1 * SizeConfig.heightMultiplier,),
                Text("Description : "+widget.demand["description"], style: TextStyle(
                  color: kBodyTextColor,
                  fontSize: 3.1 * SizeConfig.textMultiplier,
                ),),
                Text("Date : "+(widget.demand["date"].toDate()).toString(), style: TextStyle(
                  color: kBodyTextColor,
                  fontSize: 3.1 * SizeConfig.textMultiplier,
                ),),
                Text("Phone N°: "+widget.demand["phone_number"], style: TextStyle(
                  color: kBodyTextColor,
                  fontSize: 3.1 * SizeConfig.textMultiplier,
                ),),
                SizedBox(height: 1 * SizeConfig.heightMultiplier,),
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
                            horizontal: 1 * SizeConfig.widthMultiplier
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
                    SizedBox(width: 1 * SizeConfig.widthMultiplier,),
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
                              Text("Max Budget", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),),
                              Text("MAD "+widget.demand["max_budget"].toString(), style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 1 * SizeConfig.widthMultiplier,),
                    auth == widget.demand["owner"] ?InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: 2 * SizeConfig.heightMultiplier,
                                horizontal: 1 * SizeConfig.widthMultiplier
                            ),
                            child: Icon(Icons.delete, color: Colors.red, size: 4 * SizeConfig.imageSizeMultiplier,)
                        ),
                      ),
                      onTap: (){
                        DemandService().deleteDemand(widget.demand.documentID);
                        Navigator.pop(context);
                      },
                    ):SizedBox(width: 0,)
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
