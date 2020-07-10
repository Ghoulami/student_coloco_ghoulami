class Offre{
  String uid;
  String owner;
  String title;
  String adresse;
  double superficie;
  double prix;
  int capacite;
  String phone_number;
  bool wifi;
  bool lave_ligne;
  bool gym;
  bool food;
  bool bus;
  DateTime now  = new DateTime.now();
  List<String>images = List<String>();

  Offre({this.uid,this.owner, this.title,this.adresse, this.superficie, this.prix, this.capacite,
      this.wifi = false, this.lave_ligne= false, this.gym= false, this.food= false, this.bus= false , this.phone_number , this.images});

  Offre.fromJson(Map json){
    this.uid= json["uid"];
    this.owner= json["owner"];
    this.title = json["title"];
    this.adresse= json["adresse"];
    this.superficie= json["superficie"];
    this.prix= json["prix"];
    this.capacite= json["capacite"];
    this.phone_number= json["phone_number"];
    this.wifi= json["wifi"];
    this.lave_ligne= json["lave_ligne"];
    this.gym= json["gym"];
    this.food= json["food"];
    this.bus= json["bus"];
    this.now= json["now"];
    this.images = json["images"].cast<String>();
    }
}