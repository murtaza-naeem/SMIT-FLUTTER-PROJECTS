import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // No background color
      body: Stack(
        children: [
          // Yellow Top Section
          Container(
            height: MediaQuery.of(context).size.height * 0.2, // 20% of screen height
            color: Color(0xFFF7C04A), // Light Yellow Color
          ),

          // White Bottom Section with Rounded Corners
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8, // 80% of screen height
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
