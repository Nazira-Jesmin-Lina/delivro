import 'package:delivro/modles/cart_modle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:delivro/Pages/LogIn_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/myProvider.dart';
import 'HomePage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late MyProvider provider;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    //Provider.of<MyProvider>(context, listen: false);

  }
    // Delay navigation to the LoginPage by 4 seconds
  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? storedEmail = preferences.getString('email');

    if (storedEmail != null && storedEmail.isNotEmpty) {
      loadCartData();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LogInPage(),
        ),
      );
    }
  }


  void loadCartData() async {
    provider = Provider.of<MyProvider>(context,listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartData = prefs.getStringList('cartData');

    if (cartData != null) {
      setState(() {
        provider.cartList = cartData
            .map((data) {
          List<String> values = data.split(',');
          return CartModle(
            name: values[0],
            price: int.parse(values[1]),
            quantity: int.parse(values[2]),
            image: values[3],
          );
        })
            .toList();
      });
    }
  }




  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to Delivro',
            style: TextStyle(
              fontSize: 40, 
              color: Color.fromARGB(255, 200, 15, 104),
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), // Adjust the spacing between text and animation
          Lottie.asset('Animation/aa.json'),
        ],
      ),
    ),
  );
}

}
