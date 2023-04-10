import 'package:adventure_nepal/models/locations_model.dart';
import 'package:flutter/material.dart';
import '../services/location_service.dart';

class LocationsProvider extends ChangeNotifier {
  LocationsProvider(this.locationsService);
  final LocationService locationsService;
  List<LocationsModel> _locations = [];

  List<LocationsModel> get locations => _locations;

  Future<void> loadLocations(String id) async {
    final result = await locationsService.fetchLocations(id);
    _locations = result;
    notifyListeners();
  }
}
