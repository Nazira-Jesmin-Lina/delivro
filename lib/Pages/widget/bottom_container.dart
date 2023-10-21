import 'package:flutter/material.dart';
class BottomContainer extends StatelessWidget{
  final String image;
  final String name;
  final int price;
  final Function ontap;
  const BottomContainer(@required this.image,@required this.name,@required this.price,@required this.ontap, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
                  ontap();
                  print("hihihi");
                },
        child: Container(
                height: 250,
                width: 200,
                margin: const EdgeInsets.only(top: 15,left: 12,right: 12,bottom: 5),
                padding: const EdgeInsets.only(top: 5,left: 15,bottom: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 234, 234),
                  borderRadius: BorderRadius.circular(8),
                    
                  boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 95, 113, 187),
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
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
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(image),
                    ),
                    ListTile(
                      leading: Text(
                          name,
                          style: const TextStyle(
                             color: Colors.black,
                             fontSize: 15,
                             fontFamily: "Pacifico",
                          ),
                        ),
                      
                     
                    ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
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
                      const SizedBox(
                        width: 12,
                      ),
                       Text(
                          '$price BDT',
                          style: const TextStyle(
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