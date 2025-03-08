import 'package:firstproject/Screens/on_boarding.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnBoarding()),
        );
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFFD54F), // Light yellow background
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Group.png",
                height: 257,
                width: 204,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
