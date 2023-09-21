import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:delivro/LogIn_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to the LoginPage by 4 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LogInPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Delivro',
            style: TextStyle(
              fontSize: 40, 
              color: Color.fromARGB(255, 200, 15, 104),
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20), // Adjust the spacing between text and animation
          Lottie.asset('Animation/aa.json'),
        ],
      ),
    ),
  );
}

}
