import 'package:flutter/material.dart';
class BottomContainer extends StatelessWidget{
  final String image;
  final String name;
  final int price;
  BottomContainer(@required this.image,@required this.name,@required this.price);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              height: 250,
              width: 200,
              margin: EdgeInsets.only(top: 4,left: 2,right: 2),
              padding: EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 234, 234),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 95, 113, 187),
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
              ),
    
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(image),
                  ),
                  ListTile(
                    leading: Text(
                        name,
                        style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontFamily: "Pacifico",
                        ),
                      ),
                    
                   
                  ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.black,
                            ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.black,
                            ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.black,
                            ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.black,
                            ),
                          Icon(
                            Icons.star,
                            size: 8,
                            color: Colors.black,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                     Text(
                        '$price BDT',
                        style: TextStyle(
                           color: Colors.black,
                           fontSize: 16,
                           fontFamily: "Pacifico",
                        ),
                      ),
                    
                  ],
                ),
              ],
              ),
            ),
    );
  }}