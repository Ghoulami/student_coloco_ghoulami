import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_coloco_ghoulami/models/offre.dart';

class OffreServices {
  // collection reference
  final CollectionReference offerCollection = Firestore.instance.collection('Offers');

  Future<String> addOffreData(Offre offre) async {
    DocumentReference ref = await offerCollection.add({
     "owner":offre.owner,
     "title":offre.title,
     "adresse":offre.adresse,
     "superficie":offre.superficie,
     "prix" : offre.prix,
     "capacite" : offre.capacite,
     "phone_number":offre.phone_number,
     "wifi":offre.wifi,
     "lave_ligne":offre.lave_ligne,
     "gym":offre.gym,
     "food":offre.food,
     "bus":offre.bus,
      "data" : offre.now,
    });
    return ref.documentID;
  }
}