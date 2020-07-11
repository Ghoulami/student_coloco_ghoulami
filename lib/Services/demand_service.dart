
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_coloco_ghoulami/models/demand.dart';

class DemandService{
  // collection reference
  final CollectionReference offerCollection = Firestore.instance.collection('Demands');
  Future<String> addDemandData(Demand demand) async {
    DocumentReference ref = await offerCollection.add({
      "owner":demand.owner,
      "title":demand.title,
      "adresse":demand.adresse,
      "description":demand.description,
      "max_budget" : demand.max_budget,
      "phone_number":demand.phone_number,
    });
    return ref.documentID;
  }
}