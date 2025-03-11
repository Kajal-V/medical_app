import 'package:flutter/material.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  String? _mobileError;
  String? _passwordError;

  void loginUser(BuildContext context) {
    String mobileNumber = mobileController.text.trim();
    String password = passwordController.text;

    // Reset error messages
    setState(() {
      _mobileError = null;
      _passwordError = null;
    });

    // Mobile number validation
    if (mobileNumber.isEmpty) {
      setState(() {
        _mobileError = "⚠ Mobile number is required";
      });
      return;
    }

    if (mobileNumber.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobileNumber)) {
      setState(() {
        _mobileError = "⚠ Enter a valid 10-digit mobile number";
      });
      return;
    }

    // Password validation
    if (password.isEmpty) {
      setState(() {
        _passwordError = "⚠ Password is required";
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        _passwordError = "⚠ Password must be at least 6 characters";
      });
      return;
    }

    // Predefined valid credentials (for demo purposes)
    String validMobile = "1234567890";
    String validPassword = "password123";

    if (mobileNumber != validMobile || password != validPassword) {
      setState(() {
        _passwordError = null; // Clear any previous errors
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 28),
                SizedBox(width: 10),
                Text("Login Failed", style: TextStyle(color: Colors.red)),
              ],
            ),
            content: Text(
              "Invalid mobile number or password. Please try again!",
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK", style: TextStyle(color: Colors.blue)),
              ),
            ],
          );
        },
      );

      return;
    }

    // Login successful - Navigate to Dashboard
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade300, Colors.blue.shade900],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 250,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Login To Your Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.blue.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Mobile Number Field
                  TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: "Enter Mobile Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                      contentPadding: EdgeInsets.all(10),
                      errorText: _mobileError, // Show error message
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                  ),

                  SizedBox(height: 15),

                  // Password Field with Eye Icon
                  TextField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      contentPadding: EdgeInsets.all(10),
                      errorText: _passwordError, // Show error message
                      errorStyle: TextStyle(color: Colors.red),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey.shade700,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        loginUser(context);
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text("or sign in with"),
                  SizedBox(height: 10),

                  // Social Media Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        icon: Icons.facebook_outlined,
                        color: Colors.blue.shade800,
                      ),
                      SizedBox(width: 10),
                      SocialLoginButton(
                        icon: Icons.g_mobiledata_outlined,
                        color: Colors.red.shade800,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Social Media Login Button Widget
class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  SocialLoginButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: color,
      ),
    );
  }
}
