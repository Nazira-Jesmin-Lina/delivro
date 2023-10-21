import 'package:flutter/material.dart';

ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor:Colors.white,
    appBarTheme: const AppBarTheme(
      color:Colors.white,),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary:Colors.white,
      secondary: Color.fromARGB(255, 230, 228, 228),
      

    ),

    buttonTheme: const ButtonThemeData(
      buttonColor:Color.fromARGB(255, 200, 15, 104),
  
    ),
    
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 59, 12, 229)  ),

    ),
    ),
);

ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
);


