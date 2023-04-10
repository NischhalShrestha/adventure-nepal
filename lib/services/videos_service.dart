import 'package:adventure_nepal/models/videos_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideosService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<VideosModel>> fetchVideos() async {
    final QuerySnapshot snapshots =
        await _firebaseFirestore.collection("AdventureVideos").get();
    return snapshots.docs
        .map((e) => VideosModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }
}
