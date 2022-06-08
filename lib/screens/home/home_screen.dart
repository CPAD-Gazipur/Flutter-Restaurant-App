import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png',height: 150,width: 150,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColorDark,
            ),
            child: const Text('Location Screen'),
          ),
        ],
      ),
    );
  }
}
