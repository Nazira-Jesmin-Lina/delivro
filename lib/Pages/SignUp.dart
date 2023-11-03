import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivro/Pages/FitScreen.dart';
import 'package:delivro/Pages/LogIn_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'widget/TextField.dart';

abstract class EmailValidationStrategy {
  bool validateEmail(String email);
}

class RegexEmailValidationStrategy extends EmailValidationStrategy {
  @override
  bool validateEmail(String email) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    return regExp.hasMatch(email);
  }
}


class SignUpPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  const SignUpPage({super.key});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}



abstract class SignUpTemplate {
  Future signUp(
      String email, String name, String password, String location, String phone);
}



class FirebaseSignUp extends SignUpTemplate {
  @override
  Future signUp(
      String email, String name, String password, String location, String phone) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseFirestore.instance.collection('userData').doc(userCredential.user!.uid).set({
        'email': email.trim(),
        'name': name.trim(),
        'password': password.trim(),
        'userID': userCredential.user!.uid,
        'image': "null",
        'location': location.trim(),
        'phone': phone.trim(),
      });
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}






class _SignUpPageState extends State<SignUpPage>{
  // String regExpPattern = SignUpPage.pattern;
  // RegExp regExp = RegExp(regExpPattern);

  SignUpTemplate signUpTemplate = FirebaseSignUp();
  bool loading=false;
  TextEditingController Email= TextEditingController();
  TextEditingController Name= TextEditingController();
  TextEditingController Password =TextEditingController();
  TextEditingController confirm_pass= TextEditingController();
  TextEditingController location =TextEditingController();
  TextEditingController phone =TextEditingController();

  final scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();

  Future sendData(SignUpTemplate signUpTemplate) async{
   try {
     await signUpTemplate.signUp(
         Email.text,
         Name.text,
         Password.text,
         location.text,
         phone.text);

     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account successfully Created, Please Log in to continue. ')));
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const LogInPage()),
     );

   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {

       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The password provided is too weak.')));
       // print('The password provided is too weak.');
       setState(() {
         loading = false;
       });

     } else if (e.code == 'email-already-in-use') {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The account already exists for that email.')));
       setState(() {
         loading = false;
       });

       // print('The account already exists for that email.');
     }
   } catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
     setState(() {
       loading = false;
     });

    }


  }
  void validation(BuildContext context, SignUpTemplate signUpTemplate){
    EmailValidationStrategy emailValidationStrategy = RegexEmailValidationStrategy();
    if (Email.text.trim().isEmpty ) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email field is empty')));
      return;
    }

    else if(!emailValidationStrategy.validateEmail(Email.text)){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter the valied email')));
      return;
    }

    if (Name.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Name field is empty')));
      return;
    }

    if (location.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('location field is empty')));
      return;
    }

    if (phone.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('phone field is empty')));
      return;
    }


    if (Password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password field is empty')));
      return;
    }

    if (confirm_pass.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('confirm password field is empty')));
      return;
    }
    if (Password.text!=confirm_pass.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password is not matched.please rewrite it')));
      return;
    }
    else{
      setState(() {
        loading=true;
      });
      sendData(signUpTemplate);
    }
  }
//339 851
 
  @override
  Widget build(BuildContext context){
    FitScreen(context);
    return Scaffold(
      key:scaffoldMessengerKey,
      body: SingleChildScrollView(
        //dragStartBehavior: DragStartBehavior.start,
        child: Column(
          children:[ 
            
           SizedBox(
            height: FitScreen.getPixelHeight(200),
            child: Image(image: AssetImage('Images/delivery_bro.png')),
          ),
          
      
          const Text('Delivro',
          style: TextStyle(color: Color.fromARGB(255, 200, 15, 104),
          fontFamily: 'Pacifico',
          fontSize: 40,
          ),
        ),
        const SizedBox(
              height: 30,
              ),     
          
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
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
        
                const SizedBox(
                height: 20,
                ),
        
              MyTextField(
              '  Name',
              Icons.person_2_outlined,
              false,
              Name,
              ),
               const SizedBox(
                height: 20,
                ),
              MyTextField(
              ' location',
              Icons.location_city_outlined,
              false,
              location,
              ),
              
              const SizedBox(
              height: 20,
              ),
              MyTextField(
              '  Phone Number',
              Icons.phone,
              false,
              phone,
              ),

              const SizedBox(
                height: 20,
              ),
              MyTextField(
                '  Password',
                Icons.lock,
                true,
                Password,
              ),
              const SizedBox(
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
        const SizedBox(
              height: 50,
              ),
        loading?const CircularProgressIndicator() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child:ElevatedButton(
                onPressed: () {
                  validation(context,signUpTemplate);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(content: Text('Sign Up Successful')));
                  // Navigator.pop(context);
      
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 200, 15, 104),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // <-- Radius
                  ),
                ),
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        )
          
        ]
      
        ),
      ),

    );
  }
}