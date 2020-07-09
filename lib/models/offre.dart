class Offre{
  final String uid;
  String title;
  double superficie;
  double prix;
  int capacite;
  bool wifi;
  bool lave_ligne;
  bool gym;
  bool food;
  bool bus;

  Offre({this.uid, this.title, this.superficie, this.prix, this.capacite,
      this.wifi, this.lave_ligne, this.gym, this.food, this.bus});
}