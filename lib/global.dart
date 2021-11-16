import 'dart:ui';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';

import 'model/user_info/user_info_model.dart';

String serverAddress = 'http://10.10.107.22:8080';

//flutter pub run build_runner build

//全局常量
class Global {
  static Global instance = Global();

  static double screenWidth = MediaQueryData.fromWindow(window).size.width;

  static double screenHeight = MediaQueryData.fromWindow(window).size.height;

  static double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  static double navigationBarHeight =
      MediaQueryData.fromWindow(window).padding.bottom;

  static final CookieJar cookieJar = new CookieJar();

  // static List<Cookie> cookies = [];

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

  static String getAvatarUrl(int userId) {
    return '$serverAddress/filetransfer/downloadprofilepic?uid=$userId';
  }

  static String getPostImageUrl(String recordid, String filename) {
    return '$serverAddress/filetransfer/download?recordid=$recordid&filename=$filename';
  }
}

//登录后用户
class LoggedInUser {
  static UserInfoModel userInfoModel;

  //登录后赋值用户信息
  static void loggedIn(UserInfoModel uim) {
    userInfoModel = uim;
  }

  /*//获取当前登录用户信息
  static UserInfoModel getLoggedInUserInfo() {
    return userInfoModel;
  }*/
}
