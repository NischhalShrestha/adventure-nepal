import 'package:adventure_nepal/models/videos_model.dart';
import 'package:flutter/material.dart';

import '../services/videos_service.dart';

class VideosProvider extends ChangeNotifier {
  VideosProvider(this.videosService);
  final VideosService videosService;
  List<VideosModel> _videos = [];

  List<VideosModel> get adventureVideos => _videos;

  Future<void> loadVideos() async {
    final result = await videosService.fetchVideos();
    _videos = result;
    notifyListeners();
  }
}
