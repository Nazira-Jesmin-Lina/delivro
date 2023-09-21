import 'dart:ffi';

import 'package:delivro/TextField.dart';
import 'package:flutter/material.dart';
import 'TextField.dart';
import 'SignUp.dart';
import 'HomePage.dart';


class LogInPage extends StatelessWidget{
  

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
              null
              ),
      
              SizedBox(
              height: 20,
              ),
      
            MyTextField(
            '  Enter Your Password',
            Icons.lock_outline,
            true,
            null,
            )
      
          ],
        
        ),
      ),
      SizedBox(
            height: 50,
            ),
      SizedBox(
        width: 100,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
      
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