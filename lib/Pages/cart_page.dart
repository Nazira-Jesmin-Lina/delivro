import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: Container(

        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 200, 15, 104),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "total",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Ubuntu"
              ),
            ),
            Text(
              "Check Out",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 200, 15, 104),
          ),
          onPressed: () {},
        ),

        title:Align(
          alignment: Alignment.topCenter,
          child: Text("Add To Cart",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
            ),),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: const Color.fromARGB(255, 200, 15, 104),
            ),
            onPressed: () {
              // Add your shopping cart icon's functionality here.
            },
          ),
        ],

      ),



      body: Container(
        // margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        // padding: EdgeInsets.symmetric(horizontal: 10),
        //height: 65,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10)),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("Images/pasta.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pasta",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text("Keya taste hain!",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Ubuntu",
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text("250 BDT",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Ubuntu",
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(onPressed: (){},
                                      icon: Icon(Icons.remove_circle_outline),
                                  color: const Color.fromARGB(255, 200, 15, 104),),
                                  Text("1",
                                    style: const TextStyle(
                                        color: const Color.fromARGB(255, 200, 15, 104),
                                      fontSize: 20,
                                      fontFamily: "Ubuntu",
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(onPressed: (){},
                                      icon: Icon(Icons.add_circle_outline_outlined),
                                    color: const Color.fromARGB(255, 200, 15, 104),)
                                ],
                              )
                            ],
                          ),

                        ),
                      IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: (){},
                      ),
                      ],
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
  
}