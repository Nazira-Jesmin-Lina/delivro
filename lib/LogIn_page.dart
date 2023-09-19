import 'package:flutter/material.dart';


class LogInPage extends StatelessWidget{
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
            '  Enter Your Mail',
              Icons.email_outlined
              ),
      
              SizedBox(
              height: 20,
              ),
      
            textField(
            '  Enter Your Password',
            Icons.password
            )
      
          ],
        
        ),
      ),
      SizedBox(
            height: 50,
            ),
      ElevatedButton(
        onPressed: () {},
        child: Text('Log In'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // <-- Radius
          ),
        ),
      ),
      Container(
        height: 200,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Create A new Account?',
          style:TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "Pacifico",
          )
          ),

          Text('Sign Up',
          style:TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontFamily: "Pacifico",
          )
          ),
        ],
      ),
      ),
      
    
      ]

      ),

    );
  }
}