import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {

  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/restaurant-details');
          },
          child: const Text('Restaurant Details'),
        ),
      ),
    );
  }
}
