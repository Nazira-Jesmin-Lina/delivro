import 'package:delivro/Pages/categories.dart';
import 'package:delivro/Pages/detailPage.dart';
import 'package:delivro/Pages/profile_page.dart';
import 'package:delivro/Pages/widget/bottom_container.dart';
import 'package:delivro/Provider/myProvider.dart';
import 'package:delivro/modles/categories_modle.dart';
import 'package:delivro/modles/food_categories_modle.dart';
import 'package:delivro/modles/food_modle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  
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
                      
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(image),
                      ),
                    
                       ],
                    )


                ),
              ),

              const SizedBox(
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
                      name: e.name,

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
                      name: e.name,

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
                      name: e.name,

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
                      name: e.name,

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
                      name: e.name,

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
                      name: e.name,

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
                      name: e.name,

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
                      name: e.name,

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
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 15,
                    ),
                ),

                onTap: () {
                  
                  if (name == 'Profile') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),

                      ),
                    );

                    }
                  else if (name == 'Cart') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),

                      ),
                    );

                    }
                  else if (name == 'Order') {
                   
                  }
                  else if (name == 'About') {
                    
                  }
                  else if (name == 'Change') {
                    
                  }
                  else if (name == 'Log Out') {
                    
                  }
                },
              );
  }
  
  @override
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
              const UserAccountsDrawerHeader(
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
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),

              const ListTile(
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


        actions: const [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
            backgroundImage: AssetImage('Images/lina_1.jpg'),
            )
            ),
         
        ],
      ),



      body: SingleChildScrollView(


        child: Container(
          margin: const EdgeInsets.symmetric(horizontal:10),
          child: Column(
            children: [
              const SizedBox(
                  height: 10,
              ),
               const Align(
                alignment: Alignment.centerLeft,
                 child: Text(
                  
                      "Hi,Are you Hungry?",
                       style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
               
                       ),
               
                       //textAlign: TextAlign.start,
                       
                             ),
               ),
             const SizedBox(
                  height: 10,
              ),
             Container(
              height: 60,
              width: double.infinity,
              margin:const EdgeInsets.only(left: 2,top: 5),
              padding: const EdgeInsets.all(10),
              //color:  Color.fromARGB(255, 200, 15, 104),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 200, 15, 104),
                borderRadius: BorderRadius.circular(10),
              ),
             child: const Row(
               children: [
                Icon(
                    Icons.discount_outlined,
                    color: Colors.white,
                ),
                 Text(
                        
                        "12% off!\n12% off upto tk800. Min order tk500",
                         style: TextStyle(
                          color:Colors.white,
                          //fontFamily: 'Ubuntu',
                         fontWeight: FontWeight.bold,
                          fontSize: 15,

                         ),

                         textAlign: TextAlign.left,
                         
                  ),
               ],
             ),
             ),
              const SizedBox(
                  height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: const Icon(Icons.search_outlined,color: Colors.black,),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 230, 228, 228),
                  border:OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 59, 12, 229),
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid,
                        width: 20.0
                        ),
                    borderRadius:BorderRadius.circular(20)
                    ),
                ),
              ),
        
      
      
      
               const SizedBox(
                    height: 40,
                  ),
      
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                      "What Are You Craving For?",
                       style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                       ),
                ),
              ),
      
              const SizedBox(
                    height: 20,
                  ),
      
      
              Row(
                children: [
      
                 // All(),
                  Pizza(),

                  const SizedBox(
                   width: 10,
                  ),

                  Burger(),

                   const SizedBox(
                   width: 10,
                  ),

                  Pasta(),
                   const SizedBox(
                   width: 10,
                  ),

                  
                ],
              ),
      
      
        
              const SizedBox(
                    height: 20,
                  ),
      
              Row(
                children: [
                  SetMenu(),
                   const SizedBox(
                   width: 10,
                  ),
                  Appetizer(),
                   const SizedBox(
                   width: 10,
                  ),
                  Dessert(),
               
                  
                 
                ],
              ),
      
               const SizedBox(
                    height: 20,
                  ),
                Row(
                  children: [
                    
                     Drinks(),
                  ],
                ),
                   const SizedBox(
                    height: 10,
                  ),
                 const Align(
                  alignment: Alignment.centerLeft,
                   child: Text(
                      "Recommended For you",
                       style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                       ),
                               ),
                 ),
      


               const SizedBox(
                    height: 20,
                  ),


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

            ],
          ),
        ),
      ),
      
    


    );
  }
}