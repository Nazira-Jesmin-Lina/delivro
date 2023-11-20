import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'cart_page.dart';

class AboutPage extends StatelessWidget {
  // Create a private static instance variable
  static final AboutPage _instance = AboutPage._internal();

  // Private constructor
  AboutPage._internal();

  // Public factory method to get the instance
  factory AboutPage() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 200, 15, 104),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "About",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: const Color.fromARGB(255, 200, 15, 104),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/bck.jpg'), // Replace with the actual path or URL
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Delivro',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Your Deliver Bro is here for delivering your Tasty Meals',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontFamily: 'Pacifico'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Delivro is your go-to food app, designed to make your food ordering experience easy and delightful. With a variety of delicious dishes, discounts, and personalized recommendations, Delivro ensures that your meals are not only tasty but also delivered with care. Enjoy the convenience of ordering your favorite food with just a few taps!',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'Pacifico'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
