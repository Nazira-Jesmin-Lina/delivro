import 'dart:ffi';

import 'package:delivro/Pages/HomePage.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget{
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required Function ontap,
    required int quantity,
  }) {
    return Container(
        margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
        padding: EdgeInsets.only(bottom: 20, left: 20, right: 5),
        //height: 65,
     //width: double.infinity ,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),

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



        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(image),
              ),
            ),


            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // SizedBox(
                      //   width: 10,
                      // ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.black),
                        onPressed: (){
                            ontap();
                        },
                      ),
                    ],
                  ),

                    Text("Keya taste hain!",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Ubuntu",
                        //fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text("$price BDT",
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
                        // IconButton(onPressed: (){
                        //   setState(() {
                        //     quantity--;
                        //   });
                        // },
                        //   icon: Icon(Icons.remove_circle_outline),
                        //   color: const Color.fromARGB(255, 200, 15, 104),),
                        Text("$quantity",
                          style: const TextStyle(
                            color: const Color.fromARGB(255, 200, 15, 104),
                            fontSize: 20,
                            fontFamily: "Ubuntu",
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        // IconButton(onPressed: (){
                        //   //print(quantity);
                        //   setState(() {
                        //     quantity++;
                        //   }
                        //   );
                        //   //print(quantity);
                        // },
                        //   icon: Icon(Icons.add_circle_outline_outlined),
                        //   color: const Color.fromARGB(255, 200, 15, 104),)
                      ],
                    )
                  ],
                ),

              ),


          ],

        ),
      );

  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider= Provider.of<MyProvider>(context);
    int total=provider.totalprice();
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
              "$total BDT",
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),

                ),
              );
            },
          ),
        ],

      ),

      body: ListView.builder(
          itemCount: provider.cartList.length,
          itemBuilder: (ctx,index){
            provider.getDeleteIndex(index);
           // print(provider.cartList[index].name);
            return cartItem(
                image: provider.cartList[index].image,
                name: provider.cartList[index].name,
                price: provider.cartList[index].price,
                ontap: (){
                  provider.delete();
                },
                quantity: provider.cartList[index].quantity,);
          },

      ),


    );
  }
}