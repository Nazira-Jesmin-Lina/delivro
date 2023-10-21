import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final String hintText;
  final IconData icon;
  final bool obsecureText;
  final TextEditingController? controller;
  const MyTextField(this.hintText,this. icon,this.obsecureText,@required this.controller, {super.key});
  @override
  Widget build(BuildContext context){
    return TextFormField(
                controller: controller,
                obscureText:obsecureText,
                decoration:  InputDecoration(
                  
                  prefixIcon: Icon(icon),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.blueGrey,
                  fontFamily: "Pacifico",
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 230, 228, 228),
                  border:OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 59, 12, 229),
                      strokeAlign: BorderSide.strokeAlignOutside,
                      style: BorderStyle.solid,
                      width: 20.0
                      ),
                    borderRadius:BorderRadius.circular(20),
                    
                    ),

                ),
              );
    
  }
}