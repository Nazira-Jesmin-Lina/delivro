import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:delivro/Pages/LogIn_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to the LoginPage by 4 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LogInPage(),
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
          const Text(
            'Welcome to Delivro',
            style: TextStyle(
              fontSize: 40, 
              color: Color.fromARGB(255, 200, 15, 104),
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), // Adjust the spacing between text and animation
          Lottie.asset('Animation/aa.json'),
        ],
      ),
    ),
  );
}

}
