import 'package:delivro/Pages/widget/bottom_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivro/Provider/myProvider.dart';

import '../modles/food_categories_modle.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  const DetailPage(@required this.image, @required this.name,@required this.price, {super.key});
  @override
  Widget build(BuildContext context) {
    List<FoodCategoriesModle> AllCategoriesList=[];


    MyProvider provider=Provider.of<MyProvider>(context);
    provider.getAllFoodCategories();
    AllCategoriesList = provider.throwAllFoodList;

    return Scaffold(

      bottomNavigationBar :
      Row(

        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 30,
            width: 40,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 200, 15, 104),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Text(
            '1',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 30,
            width: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 200, 15, 104),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 200, 15, 104),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(
                  width: 70,
                ),
                Text('Add to cart'),
              ],
            ),
          ),
        ],
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
          child: Text(name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Ubuntu",
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(

            children: <Widget>[
              Container(

                height: 250,
                color: Colors.white,
                width: double.infinity,
                //height: double.infinity,
                child: Image(
                   fit: BoxFit.fitWidth,
                    image: NetworkImage(image),


                ),
              ),
              Positioned(
                top: 200,
                // left: 100,
                // width: 1000,
                // height: 1000,
                child: Container(

                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 237, 234, 234),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 95, 113, 187),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection:Axis.vertical,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Pacifico",
                              ),
                            ),
                            Text(
                              "$price BDT",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Pacifico",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "chef's special",
                          style: TextStyle(
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "You can Order also",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),


                        //
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                          child: Row(
                            children: [
                              for (var e in AllCategoriesList)
                                BottomContainer(
                                  e.image,
                                  e.name,
                                  e.price,
                                      () {
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
                                  },
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 90),


                      ],
                    ),
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
