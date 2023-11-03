import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void sendEmail(BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: defaultEmail,
      queryParameters: {'subject': 'Contact Us Inquiry'},
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      print('Could not launch email client.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
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
              child: Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
