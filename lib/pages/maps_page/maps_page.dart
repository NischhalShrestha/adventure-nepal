import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({
    required this.location,
    Key? key,
  }) : super(key: key);

  final GeoPoint location;

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  int _counter = 0;

  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    // mapController.goToLocation(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Map'),
      ),
      body: OSMFlutter(
        controller: mapController,
        initZoom: 12,
        minZoomLevel: 5,
        maxZoomLevel: 15,
        stepZoom: 1.0,
        onMapIsReady: (bool isReady) {
          if (isReady) {
            mapController.goToLocation(widget.location);
            mapController.addMarker(widget.location);
          }
        },
        onGeoPointClicked: (GeoPoint point) {},
        userLocationMarker: UserLocationMaker(
          personMarker: const MarkerIcon(
            icon: Icon(
              Icons.location_city,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: const MarkerIcon(
            icon: Icon(
              Icons.double_arrow,
              size: 48,
            ),
          ),
        ),
        markerOption: MarkerOption(
            defaultMarker: const MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.deepOrangeAccent,
            size: 75,
          ),
        )),
      ),
    );
  }
}
