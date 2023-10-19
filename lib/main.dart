import 'package:delivro/Pages/HomePage.dart';
import 'package:delivro/Pages/Welcome_page.dart';
import 'package:delivro/Pages/detailPage.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:delivro/Theme/dark_theme.dart';
import 'package:delivro/Theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    MyApp()
    
  );
}

class MyApp extends StatelessWidget {
 

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
            appBarTheme: AppBarTheme(
              color:Colors.white,
            ),
          ),
          // theme: lightTheme,
          // darkTheme: darkTheme,
        //home: WelcomePage(),
        home: HomePage(),
      ),
    );
  }
}



