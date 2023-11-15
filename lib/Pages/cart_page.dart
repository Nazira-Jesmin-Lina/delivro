import 'dart:ffi';

import 'package:delivro/Pages/HomePage.dart';
import 'package:delivro/Pages/Processign_order.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CartPage extends StatefulWidget{
  @override
  State<CartPage> createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {
  void saveCartData() async {
    MyProvider provider= Provider.of<MyProvider>(context,listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartData = provider.cartList
        .map((item) =>
    '${item.name},${item.price},${item.quantity},${item.image}')
        .toList();

    prefs.setStringList('cartData', cartData);
    print(cartData);
  }
  @override
  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required Function ontap,
    required Function quantityDecrease,
    required Function quantityIncrease,
    required int quantity,
  }) {
    return Container(
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
                        IconButton(onPressed: (){
                          setState(() {
                            if(quantity>1) quantityDecrease();
                            saveCartData();
                          });
                        },
                          icon: Icon(Icons.remove_circle_outline),
                          color: const Color.fromARGB(255, 200, 15, 104),),
                        Text("$quantity",
                          style: const TextStyle(
                            color: const Color.fromARGB(255, 200, 15, 104),
                            fontSize: 20,
                            fontFamily: "Ubuntu",
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(onPressed: (){
                          //print(quantity);
                          setState(() {
                           quantityIncrease();
                           saveCartData();
                          }
                          );
                          //print(quantity);
                        },
                          icon: Icon(Icons.add_circle_outline_outlined),
                          color: const Color.fromARGB(255, 200, 15, 104),)
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

    void checkout(BuildContext context) async {
      // Show a loading state with circular progress indicator
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent users from dismissing the dialog
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(), // Circular progress indicator
                SizedBox(height: 16), // Spacing
                Text("Processing your order..."), // Loading text
              ],
            ),
          );
        },
      );

      // Simulate a loading delay (you can replace this with actual checkout logic)
      await Future.delayed(Duration(seconds: 2));

      // Close the loading dialog
      Navigator.of(context, rootNavigator: true).pop();

      // Show a toast message for checkout success
      Fluttertoast.showToast(
        msg: "Checkout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.pinkAccent,
        textColor: Colors.white,
        fontSize: 15,
      );

      // Clear the cart list after a successful checkout
      provider = Provider.of<MyProvider>(context,listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? cartData = prefs.getStringList('cartData');

      if (cartData != null) {
        provider.clearCart();
        cartData.clear();
        await prefs.setStringList('cartData', cartData);
      }


      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyOrderProcessingPage(),
        ),
      );
    }

    int total=provider.totalprice();
    return Scaffold(


      bottomNavigationBar: GestureDetector(
        onTap: (){
          checkout(context);

        },
        child: Container(

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
                  provider.getDeleteIndex(index);
                  provider.delete();

                },
                quantityDecrease: (){
                  provider.cartList[index].quantity--;

                },

              quantityIncrease: (){
                provider.cartList[index].quantity++;

              },
                quantity: provider.cartList[index].quantity,

            );

          },

      ),


    );
  }
}