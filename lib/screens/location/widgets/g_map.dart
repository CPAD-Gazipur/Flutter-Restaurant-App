import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatelessWidget {
  final double lat;
  final double lon;
  final Function onMapCreated;
  const GMap({Key? key,required this.lat,required this.lon,required this.onMapCreated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      //onMapCreated: onMapCreated(),
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      compassEnabled: true,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, lon),
        zoom: 7,
      ),
    );
  }
}
