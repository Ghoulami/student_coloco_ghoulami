import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:student_coloco_ghoulami/models/offre.dart';

class OffreServices {
  // collection reference
  final CollectionReference offerCollection = Firestore.instance.collection('Offers');
  final FirebaseStorage storage = FirebaseStorage.instance;

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
      "images":offre.images
    });
    return ref.documentID;
  }

  Future<Uri> uploadPic(Asset image) async {

    // ignore: deprecated_member_use
    ByteData byteData = await image.requestOriginal();
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage.instance.ref().child("images/");
    StorageUploadTask uploadTask = ref.putData(imageData);

    return await (await uploadTask.onComplete).ref.getDownloadURL();

  }
}