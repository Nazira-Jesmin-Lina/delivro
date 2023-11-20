import 'package:delivro/Pages/LogIn_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer'; // Step 1


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delivro/Pages/LogIn_page.dart';

// Command interface
abstract class ResetPasswordCommand {
  void execute(BuildContext context);
}

// Concrete command class
class ResetPasswordEmailCommand implements ResetPasswordCommand {
  final String email;

  ResetPasswordEmailCommand(this.email);

  @override
  void execute(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password Reset Email Sent Successfully.'),
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInPage(),
        ),
      );
    } catch (e) {
      print("Error sending password reset email: $e");
    }
  }
}

// Invoker class
class ResetPasswordInvoker {
  late ResetPasswordCommand _command;

  void setCommand(ResetPasswordCommand command) {
    _command = command;
  }

  void executeCommand(BuildContext context) {
    _command?.execute(context);
  }
}


class ForgetPasswordPage extends StatelessWidget {
final TextEditingController emailController = TextEditingController();
final ResetPasswordInvoker _resetPasswordInvoker = ResetPasswordInvoker();

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
            'Images/reset.png',
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
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final command = ResetPasswordEmailCommand(
                  emailController.text.toString());
              _resetPasswordInvoker.setCommand(command);
              _resetPasswordInvoker.executeCommand(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 200, 15, 104),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Reset Password'),
          ),
        ],
      ),
    ),
  );
  }
}
