import 'package:expense_management_application/screens/components/bottom_navigation_bar.dart';
import 'package:expense_management_application/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Bottom_Nav_Bar();
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}
