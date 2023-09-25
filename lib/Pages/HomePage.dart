import 'package:flutter/material.dart';

import 'SignUp.dart';
class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  Widget BottomContainer(@required String image,@required String name,@required int price){
    return Container(
            height: 250,
            width: 200,
            margin: EdgeInsets.only(top: 2),
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


  Widget drawerItem(@required String name,@required IconData icon){
    return ListTile(
                leading: Icon(icon,color: Colors.black,),
                title: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 15,
                    ),
                ),
              );
  }
  
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Images/aaa.jpeg'),
                    fit: BoxFit.cover,
                    ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('Images/lina_1.jpg'),
                ),
                accountName: Text(
                  "Nazira Jesmin Lina",
                   style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 20,
                   ),
                ),
                accountEmail: Text(
                  "nazirajesmin13@gmail.com",
                   style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 15,
                   ),
                ),
                ),
              drawerItem('Profile',Icons.person_2_outlined),
              drawerItem('Cart',Icons.add_shopping_cart_outlined),
              drawerItem('Order',Icons.shop_2_outlined),
              drawerItem('About',Icons.info_outline_rounded),
              Divider(
                thickness: 2,
                color: Colors.black,
              ),

              ListTile(
                leading: Text(
                  'Communicate',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 20,
                  ),
              
                ),
              ),

              drawerItem('Change',Icons.change_circle_outlined),
              drawerItem('Log Out',Icons.logout_outlined),

              
        ],
        )
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
            backgroundImage: AssetImage('Images/lina_1.jpg'),
            )
            ),
         
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal:10),
        child: Column(
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
                  borderSide: BorderSide(color: Color.fromARGB(255, 59, 12, 229),
                      strokeAlign: BorderSide.strokeAlignOutside,
                      style: BorderStyle.solid,
                      width: 20.0
                      ),
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
      ),
      
    


    );
  }
}