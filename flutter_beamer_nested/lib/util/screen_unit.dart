import 'package:flutter/material.dart';

class ScreenUnit {
  late double _widthUnit;
  late double _heightUnit;

  // Singleton init start
  static final ScreenUnit _instance = ScreenUnit._internal();
  ScreenUnit._internal();
  factory ScreenUnit() {
    return _instance;
  }
  // Singleton init finish

  init(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    _widthUnit = _screenWidth /
        1080; // Set 1080 same with your width of portrait figma canvas
    _heightUnit = _screenHeight /
        1920; // Set 1920 same with your height of portrait figma canvas
  }

  double width(int value) {
    return _widthUnit * value;
  }

  double height(int value) {
    return _heightUnit * value;
  }
}
