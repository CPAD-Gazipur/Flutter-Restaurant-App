import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {

  static const String routeName = '/restaurant-listing';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RestaurantListingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const RestaurantListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Listing'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/voucher');
          },
          child: const Text('Voucher'),
        ),
      ),
    );
  }
}
