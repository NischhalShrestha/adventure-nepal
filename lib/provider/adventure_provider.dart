import 'package:adventure_nepal/models/adventure_model.dart';
import 'package:adventure_nepal/services/adventure_service.dart';
import 'package:flutter/material.dart';

class AdventureProvider extends ChangeNotifier {
  AdventureProvider(this.adventureService);
  final AdventureService adventureService;
  List<AdventureModel> _adventures = [];

  List<AdventureModel> get adventures => _adventures;

  Future<void> loadAdventures() async {
    final result = await adventureService.fetchAdventures();
    _adventures = result;
    notifyListeners();
  }
}
