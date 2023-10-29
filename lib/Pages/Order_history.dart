import 'dart:ffi';

import 'package:delivro/Pages/HomePage.dart';
import 'package:delivro/Pages/Processign_order.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'cart_page.dart';
class OrderHistoryPage extends StatefulWidget{
  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPage();
}

class _OrderHistoryPage extends State<OrderHistoryPage> {


  String name = 'Burger   \u2003\u2003  2 x 180 BDT\n\nPizza   \u2003\u2003\u2003  3 x 350 BDT\n\nPizza   \u2003\u2003\u2003  3 x 350 BDT\n\nPizza   \u2003\u2003\u2003  3 x 350 BDT\n\nTotal   \u2003\u2003\u2003  1000 BDT';


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

        title:Align(
          alignment: Alignment.topCenter,
          child: Text("Order History",
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
      body:Container(
      margin: EdgeInsets.only( left: 8, right: 8,top: 8),
      padding: EdgeInsets.only(bottom: 10, left: 20, right: 5,top: 5),
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



      child: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment:Alignment.topLeft,

              child: Text(name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Ubuntu",
                  //fontWeight: FontWeight.bold,

                ),
              ),
            ),





          ],
        ),

      ),
    ),




    );
  }
}