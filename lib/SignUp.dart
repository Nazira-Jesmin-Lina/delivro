import 'package:flutter/material.dart';


class SignUpPage extends StatelessWidget{
  Widget textField(@required String hintText,@required IconData icon){
    return TextFormField(
                  decoration:  InputDecoration(
                    prefixIcon: Icon(icon),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.blueGrey,
                    fontFamily: "Pacifico",
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),

                    ),

                  ),
                );
               
}
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children:[ 
          Expanded(
          child: Container(
            child: Image(image: AssetImage('Images/Delivro.png')),
          ),
        ),

          

        
      Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            textField(
            '  Email',
              Icons.email_outlined
              ),
      
              SizedBox(
              height: 20,
              ),
      
            textField(
            '  Username',
            Icons.person_2_outlined
            ),
             SizedBox(
              height: 20,
              ),
            textField(
            '  Password',
            Icons.lock
            ),
            
            SizedBox(
            height: 20,
            ),
            textField(
            '  Confirm Password',
            Icons.lock
            )
      
          ],
        
        ),
      ),
      SizedBox(
            height: 50,
            ),
      ElevatedButton(
        onPressed: () {

          ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign Up Successful')));
          Navigator.pop(context);

        },
        child: Text('Sign Up'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // <-- Radius
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