import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(252, 245, 237, 50),
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 350,
              left: 100,
              child: Text(
                'NoMaNey',
                style: TextStyle(
                    fontFamily: 'Baloo',
                    color: Color.fromRGBO(0, 0, 0, 2),
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 200,
              left: 115,
              child: Image.asset(
                'assets/icons/Logo_icon.png',
                width: 130,
                height: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
