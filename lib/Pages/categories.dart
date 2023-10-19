import 'package:delivro/Pages/widget/bottom_container.dart';
import 'package:delivro/modles/food_categories_modle.dart';
import 'package:flutter/material.dart';
class Categories extends StatelessWidget{
  List<FoodCategoriesModle>list=[];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: GridView.count(
          shrinkWrap: false,
                  primary: false,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: list.map(
                    (e) => BottomContainer(
                    e.image,
                    e.name,
                    e.price,
                    ),
                  ).toList()
      ),
    );
  }

}