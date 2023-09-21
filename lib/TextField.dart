import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final String hintText;
  final IconData icon;
  final bool obsecureText;
  final TextEditingController? controller;
  MyTextField(this.hintText,this. icon,this.obsecureText,@required this.controller);
  @override
  Widget build(BuildContext context){
    return TextFormField(
                controller: controller,
                obscureText:obsecureText,
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
}