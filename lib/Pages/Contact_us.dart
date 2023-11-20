import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HomePage.dart';
import 'cart_page.dart';

class ContactUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactUsPage(),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  final String defaultEmail = 'nazirajesmin13@gmail.com'; // Replace with your default email address

  // Create a private static instance variable
  static final ContactUsPage _instance = ContactUsPage._internal();

  // Private constructor
  ContactUsPage._internal();

  // Public factory method to get the instance
  factory ContactUsPage() {
    return _instance;
  }

  void sendEmail(BuildContext context) async {
    print("button pressed");
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: defaultEmail,
      queryParameters: {'subject': 'Contact Us Inquiry'},
    );
    print(emailUri);
    try {
      await launchUrl(emailUri);
    } catch (e) {
      print('Could not launch email client: $e');
    }
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
            "Contact Us",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Send us an email to:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              defaultEmail,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => sendEmail(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 200, 15, 104),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // <-- Radius
                ),
              ),
              child: Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}


