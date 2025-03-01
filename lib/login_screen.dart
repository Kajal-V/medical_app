import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
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
              padding: EdgeInsets.all(20), // Add padding inside the container
              decoration: BoxDecoration(
                color: Colors.white, // Set container color to white
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Enter Username",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_2_outlined),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true, // Hide password
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
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