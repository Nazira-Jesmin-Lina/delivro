import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivro/Pages/FitScreen.dart';
import 'package:delivro/modles/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class ProfilePage extends StatelessWidget {
   Usermodle user=Usermodle(); // Assuming you have a User object

  //ProfilePage(this.user);

  Future<void> fetchData() async {
    // Assuming you are using Firebase Firestore
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    
    FirebaseFirestore.instance.collection('userData').doc(uid).get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // Get the data from Firestore
        print('yes in\n');
        final data = documentSnapshot.data() as Map<String, dynamic>;

        user.name = data['name'].toString();
        user.email = data['email'].toString();
        user.location=data['loaction'].toString();
        user.phone=data['phone'].toString();

        //here user has data.
        print(user.email);


      } else {
        print('Document does not exist on the database');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    FitScreen(context);
    fetchData(); // Call the function to fetch data

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

        title:Align(
          alignment: Alignment.topCenter,
          child: Text("Profile",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
            ),),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.all(9.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('Images/lina_1.jpg'),
              )
          ),

        ],

      ),






      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('Images/burger.jpg'),
            ),
            SizedBox(height:  FitScreen.getPixelHeight(16)),
            Text(
             "nazira",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Software Developer',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height:  FitScreen.getPixelHeight(16)),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('johndoe@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1234567890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('New York, USA'),
            ),
            SizedBox(height:  FitScreen.getPixelHeight(16)),
            ElevatedButton(
              onPressed: () {
                // Handle button press (e.g., edit profile).
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}