import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double width(BuildContext context, double percentage) =>
      screenWidth(context) * percentage;

  static double height(BuildContext context, double percentage) =>
      screenHeight(context) * percentage;
}
