import 'package:delivro/Pages/categories.dart';
import 'package:delivro/Pages/widget/bottom_container.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:delivro/modles/categories_modle.dart';
import 'package:delivro/modles/food_categories_modle.dart';
import 'package:delivro/modles/food_modle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SignUp.dart';
class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<CategoriesModle> AllList=[];
  List<CategoriesModle> PizzaList=[];
  List<CategoriesModle> BurgerList=[];
  List<CategoriesModle> SetMenuList=[];
  List<CategoriesModle> PastaList=[];
  List<CategoriesModle> AppetizerList=[];
  List<CategoriesModle> DessertList=[];
  List<CategoriesModle> DrinksList=[];

  ///single food item//
  List<FoodModle> singleFoodList=[];

  List<FoodCategoriesModle> burgerCategoriesList=[];

  List<FoodCategoriesModle> PizzaCategoriesList=[];

  List<FoodCategoriesModle> PastaCategoriesList=[];

  List<FoodCategoriesModle> SetMenuCategoriesList=[];

  List<FoodCategoriesModle> AppetizerCategoriesList=[];

  List<FoodCategoriesModle> DessertCategoriesList=[];

  List<FoodCategoriesModle> DrinksCategoriesList=[];

  List<FoodCategoriesModle> AllCategoriesList=[];


  



  Widget CategoriesContainer(
    @required Function ontap,
    @required String image,
    @required String name){
    return Column(
            children: [
              GestureDetector(
                onTap: (){
                  ontap();
                  print("hihihi");
                },
                child: Container(
                
                 margin: EdgeInsets.only(left: 20,top: 20),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    
                    image: DecorationImage(image: NetworkImage(image)),
                    // color: Colors.red,
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
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                name,
                // textAlign: TextAlign.center,
                ),
            ],
          );
  }



   Widget All(){
    return Row(
      children: AllList.map((e) => CategoriesContainer(
        (){
           Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: AllCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
    );
  }

  Widget Pizza(){
    return Row(
      children: PizzaList.map((e) => CategoriesContainer(
        (){
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: PizzaCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
    );
  }


   Widget Burger(){
    return Row(

      children: BurgerList.map((e) => CategoriesContainer(
         (){ 
          print("enter");
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
    );
  }

  Widget SetMenu(){
    return Row(
      children: SetMenuList.map((e) => CategoriesContainer(
        (){
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: SetMenuCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
    );
  }



 Widget Pasta(){
    return Row(
      children: PastaList.map((e) => CategoriesContainer(
        (){
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: PastaCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
    );
  }

  Widget Appetizer(){
    return Row(
      children: AppetizerList.map((e) => CategoriesContainer(
        (){
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: AppetizerCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
    );
  }


   Widget Dessert(){
    return Row(
      children: DessertList.map((e) => CategoriesContainer(
        (){
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: DessertCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
    );
  }

  Widget Drinks(){
    return Row(
      children: DrinksList.map((e) => CategoriesContainer(
        (){
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: DrinksCategoriesList,

                    ),
                  ),
                );
        },
        e.image, 
        e.name
        )).toList(),
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
    MyProvider provider=Provider.of<MyProvider>(context);
    //1st//
    provider.getCategories();
    AllList = provider.throwList;
    //2nd//
    provider.getPizzaCategory();
    PizzaList= provider.throwPizzaList;
    //3rd//
    provider.getBurgerCategory();
    BurgerList= provider.throwBurgerList;
    //4th//
    provider.getPastaCategory();
    PastaList= provider.throwPastaList;
    //5th//
    provider.getSetMenuCategory();
    SetMenuList= provider.throwSetMenuList;
    //6th//
    provider.getAppetizerCategory();
    AppetizerList= provider.throwAppetizerList;
    //7th//
    provider.getDessertCategory();
    DessertList= provider.throwDessertList;
    //8th//
    provider.getDrinksCategory();
    DrinksList= provider.throwDrinksList;

    /////single food list//
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

  ///food category//
  
    provider.getAllFoodCategories();
    AllCategoriesList = provider.throwAllFoodList;

    provider.getBurgerFoodCategory();
    burgerCategoriesList = provider.throwBurgerFoodList;

    provider.getPizzaFoodCategory();
    PizzaCategoriesList = provider.throwPizzaFoodList;

    provider.getPastaFoodCategory();
    PastaCategoriesList = provider.throwPastaFoodList;

    provider.getSetMenuFoodCategory();
    SetMenuCategoriesList = provider.throwSetMenuFoodList;

    provider.getAppetizerFoodCategory();
    AppetizerCategoriesList = provider.throwAppetizerFoodList;

    provider.getDessertFoodCategory();
    DessertCategoriesList = provider.throwDessertFoodList;

    provider.getDrinksFoodCategory();
    DrinksCategoriesList = provider.throwDrinksFoodList;


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

                  All(),
                  Pizza(),
                  Burger(),
                  Pasta(),
                  SetMenu(),
                  Appetizer(),
                  Dessert(),
                  Drinks(),
                  // CategoriesContainer(
                  //  'Images/all_1.png',
                  //  'All',
                  //  ),
                  
                  // CategoriesContainer(
                  //  'Images/pizza_2.jpg',
                  //  'Pizza',
                  //  ),
                  
                  // CategoriesContainer(
                  //  'Images/burger_1.jpg',
                  //  'Burger',
                  //  ),
                  
                  // CategoriesContainer(
                  //  'Images/pasta_1jpg.jpg',
                  //  'Pasta',
                  //  ),
                  
                  // CategoriesContainer(
                  //  'Images/setmenu_2.jpg',
                  //  'Set menu',
                  //  ),
                  
                  // CategoriesContainer(
                  //  'Images/dessert_1.jpg',
                  //  'Dessert',
                  //  ),
                  
      
                  // CategoriesContainer(
                  //  'Images/sides_2jpeg.jpeg',
                  //  'Appetizer',
                  //  ),
                  
      
                  // CategoriesContainer(
                  // 'Images/Juice_1.png',
                  // 'Juice',
                  // ),
                  
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
                children: singleFoodList.map(
                  (e) => BottomContainer(
                  e.image,
                  e.name,
                  e.price,
                  ),
                ).toList()
              // children: [
              //   bottomContainer(
              //     'Images/pizza_2.jpg', 
              //     'Pizza', 
              //      350
              //      ),
            
              //   bottomContainer(
              //     'Images/burger_1.jpg', 
              //     'burger', 
              //      250
              //      ),
            
              //   bottomContainer(
              //     'Images/pasta_1jpg.jpg', 
              //     'Pasta', 
              //      300
              //      ),
            
              //   bottomContainer(
              //     'Images/momo_1.jpg', 
              //     'Momo', 
              //      200
              //      ),

              //   bottomContainer(
              //     'Images/pasta_1jpg.jpg', 
              //     'Pasta', 
              //      300
              //      ),
            
              //   bottomContainer(
              //     'Images/momo_1.jpg', 
              //     'Momo', 
              //      200
              //      ),
              // ],
              ),
            ),
      
          ],
        ),
      ),
      
    


    );
  }
}