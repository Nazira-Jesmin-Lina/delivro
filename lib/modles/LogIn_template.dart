import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/HomePage.dart';

abstract class LoginTemplate {
  BuildContext context; // Add context variable

  LoginTemplate(this.context); // Constructor to initialize context

  Future login(BuildContext context,String email, String password,Function(bool) onLoginComplete);
}




class FirebaseLogin extends LoginTemplate {
  FirebaseLogin(BuildContext context) : super(context); // Pass context to superclass

  @override
  Future login(BuildContext context,String email, String password,Function(bool) onLoginComplete) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Successful')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      onLoginComplete(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No user found for that email.')));
        onLoginComplete(false);
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password provided for that user.')));
        onLoginComplete(false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid Credentials.')));
        onLoginComplete(false);
      }
      // setState(() {
      //   loading = false;
      // });
    }
  }
}

