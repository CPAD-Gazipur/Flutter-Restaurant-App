import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/screens/location/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(23.8103, 90.4125),
                zoom: 15,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 50,
                  width: 50,
                ),
                const Expanded(
                  child: LocationSearchBox(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  onPrimary: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
