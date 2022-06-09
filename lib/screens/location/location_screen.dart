import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_app/blocs/auto_complete/auto_complete_bloc.dart';
import 'package:flutter_restaurant_app/blocs/geo_location/geo_location_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'widgets/g_map.dart';
import 'widgets/location_search_box.dart';

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
            child: BlocBuilder<GeoLocationBloc, GeoLocationState>(
              builder: (context, state) {
                if (state is GeoLocationLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is GeoLocationLoaded) {
                  return GMap(
                    lat: state.position.latitude,
                    lon: state.position.longitude,
                    onMapCreated: (GoogleMapController gMapController) {
                      //controller.complete(gMapController);
                    },
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const LocationSearchBox(),
                      BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
                          builder: (context, state) {
                        if (state is AutoCompleteLoading) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        } else if (state is AutoCompleteLoaded) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 300,
                            color: state.placeAutocomplete.isNotEmpty
                                ? Colors.black.withOpacity(0.6)
                                : Colors.transparent,
                            child: ListView.builder(
                              itemCount: state.placeAutocomplete.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    state.placeAutocomplete[index].description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          );
                        }

                        return Container();
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
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
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*void _currentLocation() async  {

    final GoogleMapController gMapController = await controller.future;
    LocationData currentLocation;
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      throw Exception('Error');
    }

    gMapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 7.0,
      ),
    ));

  }*/
}
