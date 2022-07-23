import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? heading = 0;

  @override
  void initState() {
    // TODO: implement initState
    FlutterCompass.events!.listen(
      (event) {
        setState(
          () {
            heading = event.heading;
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Compass App'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${heading!.ceil()}°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding:const EdgeInsets.all(18),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/cadrant.png'),
                Transform.rotate(angle: ((heading??0)*(pi /180) * -1),
                child: Image.asset('assets/compass.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
