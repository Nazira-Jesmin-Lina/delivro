import 'package:flutter/material.dart';

ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor:Colors.white,
    appBarTheme: AppBarTheme(
      color:Colors.white,),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary:Colors.white,
      secondary: const Color.fromARGB(255, 230, 228, 228),
      

    ),

    buttonTheme: ButtonThemeData(
      buttonColor:Color.fromARGB(255, 200, 15, 104),
  
    ),
    
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 59, 12, 229)  ),

    ),
    ),
);

ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
);


