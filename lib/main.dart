import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_app/blocs/auto_complete/auto_complete_bloc.dart';
import 'package:flutter_restaurant_app/blocs/geo_location/geo_location_bloc.dart';
import 'package:flutter_restaurant_app/repositories/geolocation/geolocation_repository.dart';
import 'package:flutter_restaurant_app/repositories/repositories.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeoLocationRepository>(
          create: (_) => GeoLocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeoLocationBloc(
              geoLocationRepository: context.read<GeoLocationRepository>(),
            )..add(
                LoadGeoLocation(),
              ),
          ),
          BlocProvider(
            create: (context) => AutoCompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(
              const LoadAutocomplete(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Restaurant Management App',
          debugShowCheckedModeBanner: false,
          theme: restaurantTheme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: LocationScreen.routeName,
        ),
      ),
    );
  }
}
