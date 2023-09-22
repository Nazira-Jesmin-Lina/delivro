import 'dart:ffi';

import 'package:delivro/TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'TextField.dart';
import 'SignUp.dart';
import 'HomePage.dart';


class LogInPage extends StatefulWidget{
  
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool loadding=false;
  //RegExp regExp = RegExp(LogInPage.pattern);
  bool loading=false;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  final scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();

  Future loginAuth() async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successfull')));
      Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
    } on FirebaseAuthException catch (e) {
      print('hhhhhhhh');
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user found for that email.')));

      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong password provided for that user.')));
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials.')));
      }
      setState(() {
        loading=false;
      });
    }

  }

  void validation() {
    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All Field is Empty")));
        return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email is Empty")));
      return;
    } 
    // else if (!regExp.hasMatch(email.text)) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("lease enter vaild Email")));
    //   return;
    // }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is Empty")));
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginAuth();

    }
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children:[ 
          Expanded(
          child: Container(
            child: Image(image: AssetImage('Images/Delivro_3.png')),
          ),
        ),

        
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            MyTextField(
            '  Enter Your Mail',
              Icons.email_outlined,
              false,
              email,
              ),
      
              SizedBox(
              height: 20,
              ),
      
            MyTextField(
            '  Enter Your Password',
            Icons.lock_outline,
            true,
            password,
            )
      
          ],
        
        ),
      ),
      SizedBox(
            height: 50,
            ),
      loading?CircularProgressIndicator():Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
              //   Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomePage()),
              // );
                validation();
          
              },
              child: Text('Log In'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 200, 15, 104),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // <-- Radius
                ),
              ),
            ),
          ),
        ],
      ),
      Container(
        height: 200,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Dont have an Account?',
          style:TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "Pacifico",
          )
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the SignUpPage when "Sign Up" text is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
            child:Text('Sign Up',
            style:TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: "Pacifico",
              decoration: TextDecoration.underline,
            )
            ),
          ),

          
        ],
      ),
      ),
      
    
      ]

      ),

    );
  }
}