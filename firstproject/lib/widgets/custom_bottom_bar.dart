import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/images/Frame_56.png",
            width: double.infinity, // Make it responsive
            fit: BoxFit.cover, // Ensure it stretches properly
          ),
        ),
      ],
    );
  }
}
