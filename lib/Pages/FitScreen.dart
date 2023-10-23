import 'package:flutter/cupertino.dart';

class FitScreen{
  static double mockupWidth = 393;
  static double mockupHeight = 851;
  static double width = 0;
  static double height = 0;

  FitScreen(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  static double getPixelWidth(double val) {
    return val / mockupWidth * width;
  }

  static double getPixelHeight(double val) {
    return val / mockupHeight * height;
  }
}