import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds then navigate to Login Page
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(""),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            child: Center(
                child: Image.asset('assets/images/logo.png',
                  width: 250,
                )
            ),
          ),
          Text("data"),
          Text("Login To Your Account",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.blue.shade900,
              ),
            textAlign: TextAlign.left,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_2_outlined),
                    contentPadding: EdgeInsets.all(5),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  // keyboardType: TextInputType.,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                    contentPadding: EdgeInsets.all(5),
                    suffixIcon: IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  
                ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: 320,
            height: 40,
            child: ElevatedButton(
                onPressed: (){},
                child: Text("login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  foregroundColor: Colors.white,
                ),
            ),
          ),
          SizedBox(height: 40,),
          Text("or sign in with"),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade800, width: 1),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  width: 40,
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.facebook_outlined),
                      color: Colors.blue.shade800,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.shade800, width: 1),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.g_mobiledata_outlined),
                      color: Colors.red.shade800,

                  ),
                ),

              ],
            ),
          )
        ],
      )
    );
  }
}
