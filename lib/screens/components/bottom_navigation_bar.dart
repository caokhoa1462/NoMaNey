import 'package:expense_management_application/screens/all_screens/account_screen.dart';
import 'package:expense_management_application/screens/all_screens/chat_screen.dart';
import 'package:expense_management_application/screens/all_screens/history_screen.dart';
import 'package:expense_management_application/screens/main_screen.dart';
import 'package:expense_management_application/screens/all_screens/records_expenditures_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  const Bottom_Nav_Bar({super.key});

  @override
  State<Bottom_Nav_Bar> createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
  final user = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    MainScreen(),
    ScreenRecordsExpenditures(),
    ChatScreen(),
    HistoryScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(113, 99, 156, 1),
                Color.fromRGBO(7, 58, 103, 1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
            child: GNav(
              onTabChange: (newIndex) {
                setState(() => _selectedIndex = newIndex);
              },
              backgroundColor: Colors.transparent,
              color: Colors.white, // Màu của biểu tượng và chữ
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 3,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(icon: Icons.home,text: 'Home'),
                GButton(icon: Icons.money, text: 'Records'),
                GButton(icon: Icons.chat_bubble, text: 'Chat'),
                GButton(icon: Icons.history, text: 'History'),
                GButton(icon: Icons.person, text: 'Account'),
              ],
              // selectedIndex: _selectedIndex,
              // onTabChange: (index) {
              //   setState(() {
              //     _selectedIndex = index;
              //   });
              // },
            ),
          ),
        ),
      ),
    );
  }
}
