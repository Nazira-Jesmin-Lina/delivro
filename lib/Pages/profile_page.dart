import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../modles/user.dart';
import 'FitScreen.dart';
import 'HomePage.dart';


class ProfilePage extends StatelessWidget {
  // Create a private constructor for the Singleton pattern
  ProfilePage._internal();

  // Singleton instance
  static final ProfilePage _instance = ProfilePage._internal();

  // Factory constructor to return the instance
  factory ProfilePage() => _instance;

  Usermodle user = Usermodle();

  Future<DocumentSnapshot> fetchData() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    return await FirebaseFirestore.instance.collection('userData').doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    FitScreen(context);

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
            "Profile",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions:  const [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('Images/lina_1.jpg'),
            ),
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final data = snapshot.data!.data() as Map<String, dynamic>;

              user.name = data['name'].toString();
              user.email = data['email'].toString();
              user.location = data['location'].toString();
              user.phone = data['phone'].toString();

              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                   Stack(
                      alignment: AlignmentDirectional.bottomEnd,

                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('Images/burger.jpg'),
                        ),
                        // SizedBox(
                        //   height: FitScreen.getPixelHeight(-20),
                        // ),
                        // IconButton(
                        //   onPressed: () async {
                        //     final picker = ImagePicker();
                        //     final pickedFile = await picker.getImage(source: ImageSource.gallery); // Use ImageSource.camera for the camera
                        //
                        //     if (pickedFile != null) {
                        //       // A file was picked; you can use pickedFile.path to access the selected image
                        //       // You can then use this image path to update the profile picture
                        //       // Example: updateProfilePicture(pickedFile.path);
                        //     } else {
                        //       // User canceled image selection
                        //     }
                        //   },
                        //   icon: Icon(
                        //     Icons.add_a_photo_rounded,
                        //     color: Colors.grey,
                        //     size: FitScreen.getPixelHeight(40),
                        //   ),
                        // )

                      ],
                    ),
                    SizedBox(height: FitScreen.getPixelHeight(16)),
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: FitScreen.getPixelHeight(36)),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(user.email),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(user.phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(user.location),
                    ),
                    SizedBox(height: FitScreen.getPixelHeight(16)),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press (e.g., edit profile).
                      },
                      child: Text('Edit Profile'),
                    ),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator(); // Loading indicator
            }
          } else {
            return CircularProgressIndicator(); // Loading indicator
          }
        },
      ),
    );
  }
}
