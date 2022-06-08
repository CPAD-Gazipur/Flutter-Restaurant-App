import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CheckoutScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/delivery-time');
          },
          child: const Text('DeliveryTime Screen'),
        ),
      ),
    );
  }
}
