import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(113, 99, 156, 1),
              Color.fromRGBO(7, 58, 103, 1),
            ],
            transform: const GradientRotation(4),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Container(
                height: 200,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/icons/Logo_icon.png',
                  width: 130,
                  height: 130,
                ),
              ),
            ),
            Text(
              'NoMaNey',
              style: TextStyle(
                  fontFamily: 'Baloo',
                  color: Color.fromRGBO(208, 202, 202, 0.996),
                  fontSize: 45,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
