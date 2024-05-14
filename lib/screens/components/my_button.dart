import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;
  final Widget? child;

  const MyButton({
    super.key, 
    required this.onTap,
    required this.child
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Sử dụng onTap ở đây
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 90),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(68, 66, 69, 1),
              Color.fromRGBO(77, 79, 77, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
