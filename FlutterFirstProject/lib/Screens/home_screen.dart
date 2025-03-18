import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(
            color: Color(0xFFF5CB58),
            height: screenHeight,
            width: screenWidth,
          ),

          // App Bar with Search Bar & Icons
          Positioned(
            top: screenHeight * 0.08, // Adjusted for status bar
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Search Bar with Reduced Height & Width
                SizedBox(
                  width: screenWidth * 0.6, // Slightly reduced width
                  height: screenHeight * 0.05, // Reduced height
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.04,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: screenWidth * 0.05, // Reduced size
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(5), // Adjusted padding
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE95322),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: screenWidth * 0.045, // Smaller size
                            ),
                            onPressed: () {
                              // Filter button action
                            },
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ), // Rounded edges
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01, // Adjusted padding
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: screenWidth * 0.02,
                ), // Space between search and icons
                // Icons (Smaller size & Proper Spacing)
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/profile.png', // Your asset icon
                      width: screenWidth * 0.08, // Adjust size
                      height: screenWidth * 0.08,
                    ),
                    SizedBox(width: screenWidth * 0.01), // Space between icons
                    Image.asset(
                      'assets/icons/notification.png', // Your asset icon
                      width: screenWidth * 0.08, // Adjust size
                      height: screenWidth * 0.08,
                    ),
                    SizedBox(width: screenWidth * 0.01), // Space between icons
                    Image.asset(
                      'assets/icons/cart.png', // Your asset icon
                      width: screenWidth * 0.08, // Adjust size
                      height: screenWidth * 0.08,
                    ),
                  ],
                ),
              ],
            ),
            
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.05,
            child: Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/Frame_56.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
