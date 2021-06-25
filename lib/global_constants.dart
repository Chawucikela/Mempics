import 'dart:ui';

import 'package:flutter/material.dart';
 
 String serverAddress = 'http://172.16.129.98:8080';

//全局常量
class GlobalConstants {
  static GlobalConstants instance = GlobalConstants();

  static double screenWidth = MediaQueryData.fromWindow(window).size.width;

  static double screenHeight = MediaQueryData.fromWindow(window).size.height;

  static double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  static double navigationBarHeight =
      MediaQueryData.fromWindow(window).padding.bottom;

  //白色
  static Color memWhite = Color.fromARGB(255, 255, 255, 255);
  //背景灰
  static Color memBgGrey = Color.fromARGB(255, 240, 240, 240);
  //浅灰
  static Color memLightGrey1 = Color.fromARGB(255, 180, 180, 180);
  //浅灰2
  static Color memLightGrey2 = Color.fromARGB(255, 150, 150, 150);
  //深灰1
  static Color memDarkGrey1 = Color.fromARGB(255, 110, 110, 110);
  //深灰2
  static Color memDarkGrey2 = Color.fromARGB(255, 50, 50, 50);
  //主题蓝
  static Color memBlue = Color.fromARGB(255, 19, 108, 250);
}
