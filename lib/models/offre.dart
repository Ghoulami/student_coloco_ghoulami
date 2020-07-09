class Offre{
  final String uid;
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

  Offre({this.uid,this.owner, this.title, this.superficie, this.prix, this.capacite,
      this.wifi = false, this.lave_ligne= false, this.gym= false, this.food= false, this.bus= false , this.phone_number});
}