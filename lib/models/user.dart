
class User{
  final String uid;
  String last_name = "";
  String fist_name="";
  String email="";
  String password;
  Set<String>favorits=null;

  User({this.uid, this.last_name, this.fist_name, this.email,this.password,this.favorits});
}