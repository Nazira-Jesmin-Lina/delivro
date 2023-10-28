import 'dart:ffi';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../modles/user.dart';
import 'FitScreen.dart';
import 'HomePage.dart';
import 'dart:io';


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

    //Dipto ei image ta replace korbi

    String image='https://thecozycook.com/wp-content/uploads/2020/02/Copycat-McDonalds-French-Fries-.jpg';



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
                          backgroundImage: NetworkImage(image),
                        ),
                        // SizedBox(
                        //   height: FitScreen.getPixelHeight(-20),
                        // ),
                        IconButton(
                          onPressed: () async {
                            final imagePicker = ImagePicker();
                            final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

                            if (pickedFile != null) {
                              File file = File(pickedFile.path);

                              // Get the reference to the Firebase Storage bucket
                              final FirebaseStorage storage = FirebaseStorage.instance;
                              Reference storageRef = storage.ref().child('images/${DateTime.now()}.jpg');

                              UploadTask uploadTask = storageRef.putFile(file);

                              // Monitor the upload task
                              TaskSnapshot snapshot = await uploadTask;
                              if (snapshot.state == TaskState.success) {
                                // The image was successfully uploaded. You can get its download URL.
                                String downloadUrl = await snapshot.ref.getDownloadURL();
                                print("Image uploaded to Firebase Storage. Download URL: $downloadUrl");
                                String? uid = FirebaseAuth.instance.currentUser?.uid;
                                FirebaseFirestore.instance.collection('userData').doc(uid).set({
                                  'image':downloadUrl
                                });
                              } else {
                                // Handle the upload failure.
                                print("Image upload failed.");
                              }
                            } else {
                              // Handle no image selected from the gallery.
                              print("No image selected.");
                            }
                          },
                          icon: Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.grey,
                            size: FitScreen.getPixelHeight(40),
                          ),
                        )


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
