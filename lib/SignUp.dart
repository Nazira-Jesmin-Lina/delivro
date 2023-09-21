import 'package:flutter/material.dart';

import 'TextField.dart';

class SignUpPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  // String regExpPattern = SignUpPage.pattern;
  // RegExp regExp = RegExp(regExpPattern);
  TextEditingController Email= TextEditingController();
  TextEditingController username= TextEditingController();
  TextEditingController Password =TextEditingController();
  TextEditingController confirm_pass= TextEditingController();

  final scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();

  void validation(BuildContext context) {
    RegExp regExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
     );
    if (Email.text.trim().isEmpty || Email.text.trim() == null ) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email field is empty')));
      return;
    }

    else if(!regExp.hasMatch(Email.text)){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter the valied email')));
      return;
    }

    if (username.text.trim().isEmpty || username.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('username field is empty')));
      return;
    }

    if (Password.text.trim().isEmpty || Password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password field is empty')));
      return;
    }

    if (confirm_pass.text.trim().isEmpty || confirm_pass.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('confirm password field is empty')));
      return;
    }
  }

 
  Widget build(BuildContext context){
    
    return Scaffold(
      key:scaffoldMessengerKey,
      body: Column(
        children:[ 
          Expanded(
          child: Container(
            child: Image(image: AssetImage('Images/Delivro_2.png')),
          ),
        ),

          

        
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            MyTextField(
            '  Email',
              Icons.email_outlined,
              false,
              Email,
              ),
      
              SizedBox(
              height: 20,
              ),
      
            MyTextField(
            '  Username',
            Icons.person_2_outlined,
            false,
            username,
            ),
             SizedBox(
              height: 20,
              ),
            MyTextField(
            '  Password',
            Icons.lock,
            true,
            Password,
            ),
            
            SizedBox(
            height: 20,
            ),
            MyTextField(
            '  Confirm Password',
            Icons.lock,
            true,
            confirm_pass,
            )
      
          ],
        
        ),
      ),
      SizedBox(
            height: 50,
            ),
      SizedBox(
        width: 150,
        child:ElevatedButton(
          onPressed: () {
            validation(context);
            // ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text('Sign Up Successful')));
            // Navigator.pop(context);

          },
          child: Text('Sign Up'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 200, 15, 104),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // <-- Radius
            ),
          ),
        ),
      ),
      SizedBox(
        height: 80,
      )
    
      ]

      ),

    );
  }
}