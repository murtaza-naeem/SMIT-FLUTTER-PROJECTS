import 'package:firstproject/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  "New Account",
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // 👈 Important Fix
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.03),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField("Full Name", "John Doe", false),
                        SizedBox(height: screenHeight * 0.01),
                        _buildTextField("Email", "example@example.com", false),
                        SizedBox(height: screenHeight * 0.01),
                        _buildTextField("Password", "********", true),
                        SizedBox(height: screenHeight * 0.01),
                        _buildTextField(
                          "Mobile Number",
                          "+92 300 1234567",
                          false,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        _buildTextField(
                          "Date of Birth",
                          "DD / MM / YYYY",
                          false,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.10,
                      ), // 👈 10% Padding from both sides
                      child: Center(
                        child: Text(
                          "By continuing, you agree to Terms of Use and Privacy Policy.",
                          textAlign: TextAlign.center, // 👈 Centered Text
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Color(0xFF252525),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Sign Up Button
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
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Social Login
                    Center(
                      child: Text(
                        "Or sign up with",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.005),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton("assets/icons/Google_Icon.png"),
                        _socialButton("assets/icons/Facebook_Icon.png"),
                        _socialButton("assets/icons/Fingerprint_Icon.png"),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.005),

                    // Sign Up Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "log in",
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
