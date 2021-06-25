import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mempics/pages/splash_page.dart';

///app程序入口
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //锁定程序显示方向为竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mempics',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 19, 108, 250),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //启动页
      home: SplashPage(),
      builder: (context, widget) {
        return MediaQuery(
          //设置文字大小不随系统设置改变
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            body: GestureDetector(
              child: widget,
              onTap: () {
                //全局设置点击空白退出软键盘
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus.unfocus();
                }
                SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
              },
            ),
          ),
        );
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}
