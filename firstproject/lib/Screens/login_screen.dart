import 'package:firstproject/Screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // --- Background Color ---
          Container(
            color: Color(0xFFF5CB58),
            height: screenHeight,
            width: screenWidth,
          ),

          // --- Yellow Header ---
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.18,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Color(0xFFF5CB58),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: screenWidth * 0.09,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // --- Back Button (Left Corner) ---
          Positioned(
            top: screenHeight * 0.07,
            left: screenWidth * 0.05,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: screenWidth * 0.06,
                color: Color(0xFFE95322),
              ),
            ),
          ),

          // --- White Container ---
          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
            bottom: screenHeight * 0, // Bottom Bar space updated
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.04),

                    // Welcome Text
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Email Field
                    _buildTextField(
                      "Email or Mobile Number",
                      "example@example.com",
                      false,
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Password Field with Custom Icon
                    _buildTextField("Password", "********", true),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFFE95322),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.035),

                    // Login Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE95322),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.2,
                            vertical: screenHeight * 0.015,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(
                            screenWidth * 0.6,
                            screenHeight * 0.06,
                          ),
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Social Login
                    Center(
                      child: Text(
                        "Or sign up with",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton("assets/icons/Google_Icon.png"),
                        _socialButton("assets/icons/Facebook_Icon.png"),
                        _socialButton("assets/icons/Fingerprint_Icon.png"),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // Sign Up Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Color(0xFFE95322),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.04),
                  ],
                ),
              ),
            ),
          ),

          // --- Bottom Navigation Bar ---
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

  // --- Custom TextField Widget ---
  Widget _buildTextField(String label, String hint, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: isPassword ? _obscureText : false,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Color(0xFFF3E9B5),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon:
                isPassword
                    ? IconButton(
                      icon: Image.asset(
                        "assets/icons/Show_Off.png",
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                    : null,
          ),
        ),
      ],
    );
  }

  // --- Custom Social Media Button ---
  Widget _socialButton(String asset) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(asset, height: 40),
    );
  }
}
