import 'package:cloud_firestore/cloud_firestore.dart';

class LocationsModel {
  String? name;
  String? address;
  GeoPoint? location;
  int? contact;
  String? locImage;

  LocationsModel({
    this.name,
    this.address,
    this.location,
    this.contact,
    this.locImage,
  });

  factory LocationsModel.fromMap(Map<String, dynamic> data) {
    return LocationsModel(
      name: data["Name"],
      address: data["Address"],
      contact: data["Contact"],
      location: data["Location"] as GeoPoint?,
      locImage: data["LocationImage"],
    );
  }
}
