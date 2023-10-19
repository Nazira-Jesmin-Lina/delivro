import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivro/modles/categories_modle.dart';
import 'package:delivro/modles/food_categories_modle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import '../modles/food_modle.dart';

///Factory pattern//

class CategoryFactory {
  Future<List<CategoriesModle>> createCategoryList(String collectionName) async {
    List<CategoriesModle> newCategoryList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('HSFP9BqFIHM1bcfWZuBt')
        .collection(collectionName)
        .get();

    querySnapshot.docs.forEach((element) {
      CategoriesModle categoryModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      newCategoryList.add(categoryModle);
    });

    return newCategoryList;
  }
}



class FoodCategoryFactory {
  Future<List<FoodCategoriesModle>> createFoodCategoryList(String collectionName) async {
    List<FoodCategoriesModle> newFoodCategoryList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('5dBnHYMAABnhG5aGwTqw')
        .collection(collectionName)
        .get();

    querySnapshot.docs.forEach((element) {
      FoodCategoriesModle foodCategoriesModle = FoodCategoriesModle(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      
      newFoodCategoryList.add(foodCategoriesModle);
    });

    return newFoodCategoryList;
  }
}




class MyProvider extends ChangeNotifier {
  List<CategoriesModle> categoriesList = [];
  List<CategoriesModle> pizzaList = [];
  List<CategoriesModle> burgerList = [];
  List<CategoriesModle> setMenuList = [];
  List<CategoriesModle> pastaList = [];
  List<CategoriesModle> appetizerList = [];
  List<CategoriesModle> dessertList = [];
  List<CategoriesModle> drinksList = [];


  Future<void> getCategories() async {
    CategoryFactory factory = CategoryFactory();
    categoriesList = await factory.createCategoryList('All');
    notifyListeners();
  }

  Future<void> getPizzaCategory() async {
    CategoryFactory factory = CategoryFactory();
    pizzaList = await factory.createCategoryList('Pizza');
    notifyListeners();
  }

  Future<void> getBurgerCategory() async {
    CategoryFactory factory = CategoryFactory();
    burgerList = await factory.createCategoryList('Burger');
    notifyListeners();
  }

  Future<void> getSetMenuCategory() async {
    CategoryFactory factory = CategoryFactory();
    setMenuList = await factory.createCategoryList('SetMenu');
    notifyListeners();
  }

  Future<void> getPastaCategory() async {
    CategoryFactory factory = CategoryFactory();
    pastaList = await factory.createCategoryList('Pasta');
    notifyListeners();
  }

  Future<void> getAppetizerCategory() async {
    CategoryFactory factory = CategoryFactory();
    appetizerList = await factory.createCategoryList('Appetizer');
    notifyListeners();
  }

  Future<void> getDessertCategory() async {
    CategoryFactory factory = CategoryFactory();
    dessertList = await factory.createCategoryList('Dessert');
    notifyListeners();
  }

  Future<void> getDrinksCategory() async {
    CategoryFactory factory = CategoryFactory();
    drinksList = await factory.createCategoryList('Drinks');
    notifyListeners();
  }

   get throwList{
    return categoriesList;
  }
  
   get throwPizzaList{
    return pizzaList;
   }

   get throwBurgerList {
    return burgerList;
  }

    get throwSetMenuList {
    return setMenuList;
  }

   get throwPastaList {
    return pastaList;
  }

   get throwAppetizerList {
    return appetizerList;
  }

    get throwDessertList {
    return dessertList;

  }

    get throwDrinksList {
    return drinksList;
  }








///////single food item//

List<FoodModle> foodModleList = [];
  Future<void> getFoodList() async {
    List<FoodModle> newSingleFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach(
      (element) {
       FoodModle foodModle = FoodModle(
          name: element['name'],
          image: element['image'],
          price: element['price'],
        );
        //print(foodModle.name);
        newSingleFoodList.add(foodModle);
      },
    );

    foodModleList = newSingleFoodList;
    notifyListeners();
  }

  get throwFoodModleList {
    return foodModleList;
  }



/////foood Category///
List<FoodCategoriesModle> allFoodList = [];
List<FoodCategoriesModle> pizzaFoodList = [];
List<FoodCategoriesModle> burgerFoodList = [];
List<FoodCategoriesModle> setMenuFoodList = [];
List<FoodCategoriesModle> pastaFoodList = [];
List<FoodCategoriesModle> appetizerFoodList = [];
List<FoodCategoriesModle> dessertFoodList = [];
List<FoodCategoriesModle> drinksFoodList = [];


Future<void> getAllFoodCategories() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    allFoodList = await factory.createFoodCategoryList('All');
    notifyListeners();
  }

  Future<void> getPizzaFoodCategory() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    pizzaFoodList = await factory.createFoodCategoryList('Pizza');
    notifyListeners();
  }

  Future<void> getBurgerFoodCategory() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    burgerFoodList = await factory.createFoodCategoryList('Burger');
    notifyListeners();
  }

  Future<void> getSetMenuFoodCategory() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    setMenuFoodList = await factory.createFoodCategoryList('SetMenu');
    notifyListeners();
  }

  Future<void> getPastaFoodCategory() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    pastaFoodList = await factory.createFoodCategoryList('Pasta');
    notifyListeners();
  }

  Future<void> getAppetizerFoodCategory() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    appetizerFoodList = await factory.createFoodCategoryList('Appetizer');
    notifyListeners();
  }

  Future<void> getDessertFoodCategory() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    dessertFoodList = await factory.createFoodCategoryList('Dessert');
    notifyListeners();
  }

  Future<void> getDrinksFoodCategory() async {
    FoodCategoryFactory factory = FoodCategoryFactory();
    drinksFoodList = await factory.createFoodCategoryList('Drinks');
    notifyListeners();
  }

   get throwAllFoodList{
    return allFoodList;
  }
  
   get throwPizzaFoodList{
    return pizzaFoodList;
   }

   get throwBurgerFoodList {
    return burgerFoodList;
  }

    get throwSetMenuFoodList {
    return setMenuFoodList;
  }

   get throwPastaFoodList {
    return pastaFoodList;
  }

   get throwAppetizerFoodList {
    return appetizerFoodList;
  }

    get throwDessertFoodList {
    return dessertFoodList;

  }

    get throwDrinksFoodList {
    return drinksFoodList;
  }






// List<FoodCategoriesModle> burgerCategoriesList = [];
   
//   Future<void> getBurgerCategoriesList() async {
//     List<FoodCategoriesModle> newBurgerCategoriesList = [];
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('foodCategories')
//         .doc('5dBnHYMAABnhG5aGwTqw')
//         .collection('Burger')
//         .get();
//     querySnapshot.docs.forEach((element) {
//       FoodCategoriesModle burgerCategoriesModle = FoodCategoriesModle(
//         image: element['image'],
//         name: element['name'],
//         price: element['price'],
//       );
//       //print(burgerCategoriesModle.name);
//       newBurgerCategoriesList.add(burgerCategoriesModle);
//       burgerCategoriesList = newBurgerCategoriesList;
//     });

    
//   }

//  get throwBurgerCategoriesList {
//     return burgerCategoriesList;
//   }

}
