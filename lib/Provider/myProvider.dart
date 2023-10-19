import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivro/modles/categories_modle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

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



}
