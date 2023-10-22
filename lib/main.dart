import 'package:delivro/Pages/Welcome_page.dart';
import 'package:delivro/Pages/cart_page.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    const MyApp()
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),

      ],
      child: MaterialApp(
    
        debugShowCheckedModeBanner: false,
          title: 'Delivro',
          theme: ThemeData(
            scaffoldBackgroundColor:Colors.white,
            appBarTheme: const AppBarTheme(
              color:Colors.white,
            ),
          ),
          // theme: lightTheme,
          // darkTheme: darkTheme,
       // home: const WelcomePage(),
        home:HomePage(),
      ),
    );
  }
}



