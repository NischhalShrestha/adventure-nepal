import 'package:adventure_nepal/models/locations_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class LocationService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<LocationsModel>> fetchLocations(String id) async {
    // final DocumentReference documentReference = await  _firebaseFirestore.doc(id).collection(collectionPath)
    final QuerySnapshot locationsQuery = await _firebaseFirestore
        .collection("Adventure")
        .doc(id)
        .collection("Locations")
        .get();
    return locationsQuery.docs
        .map((e) => LocationsModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }
}
