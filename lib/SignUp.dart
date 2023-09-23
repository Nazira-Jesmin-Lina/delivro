import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  bool loading=false;
  TextEditingController Email= TextEditingController();
  TextEditingController Name= TextEditingController();
  TextEditingController Password =TextEditingController();
  TextEditingController confirm_pass= TextEditingController();

  final scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();

  Future sendData() async{
   try {
        final userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email.text,password: Password.text );
        FirebaseFirestore.instance.collection('userData').doc(userCredential.user!.uid).set({
          'email': Email.text.trim(),
          'name': Name.text.trim(),
          'password': Password.text.trim(),
          'userID': userCredential.user!.uid
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account successfully Created ')));

      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The password provided is too weak.')));
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The account already exists for that email.')));

       // print('The account already exists for that email.');
      }
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        setState(() {
        loading=false;
      });

    }
    setState(() {
        loading=false;
      });

  }
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

    if (Name.text.trim().isEmpty || Name.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Name field is empty')));
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
    else{
      setState(() {
        loading=true;
      });
      sendData();
    }
  }

 
  Widget build(BuildContext context){
    
    return Scaffold(
      key:scaffoldMessengerKey,
      body: SingleChildScrollView(
        //dragStartBehavior: DragStartBehavior.start,
        child: Column(
          children:[ 
            
           Container(
            height: 200,
            child: Image(image: AssetImage('Images/delivery_bro.png')),
          ),
          
      
          Text('Delivro',
          style: TextStyle(color: Color.fromARGB(255, 200, 15, 104),
          fontFamily: 'Pacifico',
          fontSize: 40,
          ),
        ),
        SizedBox(
              height: 30,
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
              '  Name',
              Icons.person_2_outlined,
              false,
              Name,
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
        loading?CircularProgressIndicator() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
        SizedBox(
          height: 80,
        )
          
        ]
      
        ),
      ),

    );
  }
}