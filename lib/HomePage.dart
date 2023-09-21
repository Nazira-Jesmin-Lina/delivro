import 'package:flutter/material.dart';

import 'SignUp.dart';
class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  Widget BottomContainer(@required String image,@required String name,@required int price){
    return Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 234, 234),
              borderRadius: BorderRadius.circular(10),
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
                  radius: 70,
                  backgroundImage: AssetImage(image),
                ),
                ListTile(
                  leading: Text(
                      name,
                      style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         fontFamily: "Pacifico",
                      ),
                    ),
                  
                  trailing: Text(
                      '$price BDT',
                      style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         fontFamily: "Pacifico",
                      ),
                    ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.black,
                      ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.black,
                      ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.black,
                      ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.black,
                      ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.black,
                      ),
                  ],
                ),
              ),
            ],
            ),
          );
  }



  Widget CategoriesContainer(@required String image,@required String name){
    return Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 95, 113, 187),
                      offset: const Offset(
                        5.0,
                        5.0,
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
              ),

              SizedBox(
                height: 10,
              ),
              Text(name),
            ],
          );
  }
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.sort,
        color: Colors.black,),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
            backgroundImage: AssetImage('Images/lina_1.jpg'),
            )
            ),
         
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              prefixIcon: Icon(Icons.search_outlined,color: Colors.black,),
              filled: true,
              fillColor: const Color.fromARGB(255, 230, 228, 228),
              border:OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:BorderRadius.circular(20)
                ),
            ),
          ),

           SizedBox(
                height: 10,
              ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoriesContainer(
                 'Images/all_1.png',
                 'All',
                 ),
                
                CategoriesContainer(
                 'Images/pizza_2.jpg',
                 'Pizza',
                 ),
                
                CategoriesContainer(
                 'Images/burger_1.jpg',
                 'Burger',
                 ),
                
                CategoriesContainer(
                 'Images/pasta_1jpg.jpg',
                 'Pasta',
                 ),
                
                CategoriesContainer(
                 'Images/setmenu_2.jpg',
                 'Set menu',
                 ),
                
                CategoriesContainer(
                 'Images/dessert_1.jpg',
                 'Dessert',
                 ),
                

                CategoriesContainer(
                 'Images/sides_2jpeg.jpeg',
                 'Appetizer',
                 ),
                

                CategoriesContainer(
                'Images/Juice_1.png',
                'Juice',
                ),
                
              ],
            ),
          ),

          SizedBox(
                height: 20,
              ),
          
          Container(
            height: 510,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              childAspectRatio: 0.8,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
            children: [
              BottomContainer(
                'Images/pizza_2.jpg', 
                'Pizza', 
                 350
                 ),
          
              BottomContainer(
                'Images/burger_1.jpg', 
                'burger', 
                 250
                 ),
          
              BottomContainer(
                'Images/pasta_1jpg.jpg', 
                'Pasta', 
                 300
                 ),
          
              BottomContainer(
                'Images/momo_1.jpg', 
                'Momo', 
                 200
                 ),
            ],
            ),
          ),

        ],
      ),
      
    


    );
  }
}