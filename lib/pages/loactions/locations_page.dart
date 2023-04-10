import 'package:adventure_nepal/pages/maps_page/maps_page.dart';
import 'package:adventure_nepal/provider/locations_provider.dart';
import 'package:adventure_nepal/services/location_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/adventure_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart' as osm;

import '../../widgets/TextWidget.dart';

class LocationsPage extends StatefulWidget {
  final AdventureModel adventureDesc;
  const LocationsPage({super.key, required this.adventureDesc});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // final locationsProvider = Provider.of<LocationsProvider>(context);
    return ChangeNotifierProvider(
      create: (context) {
        return LocationsProvider(LocationService())
          ..loadLocations(widget.adventureDesc.id);
      },
      child: Builder(builder: (context) {
        final locationProvider = Provider.of<LocationsProvider>(context);
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
              itemCount: locationProvider.locations.length,
              itemBuilder: (context, index) {
                final location = locationProvider.locations[index];
                return Container(
                  margin: EdgeInsets.all(10.h),
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.grey.shade600,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                bottomLeft: Radius.circular(15.r)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(location.locImage.toString()),
                                fit: BoxFit.fill),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: location.name.toString(),
                            ),
                            TextWidget(
                              text: location.address.toString(),
                            ),
                            TextWidget(
                              text: location.contact.toString(),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (location.location != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MapsPage(
                                            location: osm.GeoPoint(
                                                latitude:
                                                    location.location!.latitude,
                                                longitude: location
                                                    .location!.longitude),
                                          )));
                                } else {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(const SnackBar(
                                        content:
                                            Text("No map location available")));
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.cyanAccent.shade400,
                                        Colors.greenAccent.shade400,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: const Text(
                                  'Show In Maps',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        );
      }),
    );
  }
}
