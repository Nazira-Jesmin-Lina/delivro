import 'package:delivro/Pages/LogIn_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer'; // Step 1

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController(); // Step 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 200, 15, 104),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LogInPage(),
              ),
            );
          },
        ),
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Forgot Password?",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'Images/reset.png', // Add an image asset
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Enter your email address to reset your password',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController, // Step 2 ekhane input ta nicche
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Step 3: Log the text entered in the TextFormField
                try {
                      FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.toString());
                      print("Password reset email sent");
                    } catch (e) {
                      print("Error sending password reset email: $e");
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password Reset Email Sent Succesfully.')));

                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>const LogInPage(),
                      ),
                    );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
