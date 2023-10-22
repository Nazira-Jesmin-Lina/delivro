import 'package:delivro/Pages/cart_page.dart';
import 'package:delivro/Pages/detailPage.dart';
import 'package:delivro/Pages/widget/bottom_container.dart';
import 'package:delivro/modles/food_categories_modle.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
class Categories extends StatelessWidget{
  List<FoodCategoriesModle>list=[];
  final String name;
  Categories({super.key, required this.list,required this.name});
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
            child: Text(name,
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
      body: GridView.count(
          shrinkWrap: false,
                  primary: false,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: list.map(
                    (e) => BottomContainer(
                    e.image,
                    e.name,
                    e.price,
                    (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          e.image,
                          e.name,
                          e.price,
                        ),
                      ),
                      );
                    }
                    ),
                  ).toList()
      ),
    );
  }

}