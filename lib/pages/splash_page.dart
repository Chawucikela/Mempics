import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mempics/utils/fade_animation_route.dart';

import 'base_page.dart';
import 'login_page.dart';

class SplashPage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends BasePageState<SplashPage> {
  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      Future.delayed(Duration(milliseconds: 1800), () {
        Navigator.of(context).pushAndRemoveUntil(
          FadeAnimationRoute(LoginPage()),
          (route) => route == null,
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initController_2nd() {
    // TODO: implement initController_2nd
  }

  @override
  void initData_1st() {
    // TODO: implement initData_1st
  }
}
