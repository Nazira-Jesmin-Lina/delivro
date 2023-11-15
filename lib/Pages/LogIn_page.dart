
import 'package:delivro/Pages/forget_password.dart';
import 'package:delivro/Pages/widget/TextField.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:delivro/modles/LogIn_template.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUp.dart';
import 'HomePage.dart';





class LogInPage extends StatefulWidget{
  
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  const LogInPage({super.key});


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




  void validation(LoginTemplate loginTemplate) async {

    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("All Field is Empty")));
        return;
    }
    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email is Empty")));
      return;
    } 
    // else if (!regExp.hasMatch(email.text)) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("lease enter vaild Email")));
    //   return;
    // }
    if (password.text.trim().isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password is Empty")));
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginTemplate.login(context, email.text, password.text, (bool isSuccessful) async {
        setState(() {
          loading = false;
        });

        if (isSuccessful) {

          final SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString('email', email.text);
          prefs.setString('password', password.text);
          prefs.setString('authenticationStrategy', 'emailPass');
          String saveemail = prefs.getString('email')!;
          String savepassword = prefs.getString('password')!;
          print(saveemail);
          print(savepassword);
          // Handle successful login
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login successful")));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Handle login failure
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed. Check your credentials.")));
          }
          });

    }
  }
  @override
  Widget build(BuildContext context){
    FirebaseLogin firebaseLogin = FirebaseLogin(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[ 
          const SizedBox(
            height: 250,
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
              '  Enter Your Mail',
                Icons.email_outlined,
                false,
                email,
                ),
        
                const SizedBox(
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
        const SizedBox(
              height: 5,
              ),
         SizedBox(
          height: 50,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // GestureDetector(
            //   onTap: () {
            //     // Navigate to the SignUpPage when "Sign Up" text is tapped
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SignUpPage()),
            //     );
            //   },
             
            // ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                  );
                },
                child: Text(
                  'Forget Password?  ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 200, 15, 104),
                    fontSize: 20,
                    fontFamily: "Pacifico",
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
      
            
          ],
        ),
        ),
        const SizedBox(
              height: 20,
              ),
        loading?const CircularProgressIndicator():Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {

                  validation(firebaseLogin);
            
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 200, 15, 104),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // <-- Radius
                  ),
                ),
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Dont have an Account?',
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
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child:const Text('Sign Up',
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
      ),

    );
  }
}