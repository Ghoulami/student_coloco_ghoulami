class Demand{
  String uid;
  String owner;
  String title;
  String adresse;
  String description;
  double max_budget;
  String phone_number;
  DateTime now  = new DateTime.now();
  Demand({this.uid,this.owner, this.title,this.adresse,this.max_budget,this.description, this.phone_number});

  Demand.fromJson(Map json){
    this.uid= json["uid"];
    this.owner= json["owner"];
    this.title = json["title"];
    this.adresse= json["adresse"];
    this.description= json["description"];
    this.max_budget= json["max_budget"];
    this.phone_number= json["phone_number"];
    this.now= json["now"];
  }
}