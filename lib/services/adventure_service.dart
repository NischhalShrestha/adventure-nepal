import 'package:adventure_nepal/models/adventure_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/locations_model.dart';

class AdventureService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<AdventureModel>> fetchAdventures() async {
    final QuerySnapshot snapshots =
        await _firebaseFirestore.collection("Adventure").get();
    return snapshots.docs
        .map((e) =>
            AdventureModel.fromMap(e.data() as Map<String, dynamic>, e.id))
        .toList();
  }
}
