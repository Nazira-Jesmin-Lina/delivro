import 'package:delivro/Welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MyApp()
    
  );
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
        title: 'Delivro',
        theme: ThemeData(
          scaffoldBackgroundColor:Colors.white,
          appBarTheme: AppBarTheme(
            color:Colors.white,
          ),
        ),
      home: WelcomePage(),
    );
  }
}



