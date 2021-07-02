import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key});
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  @override
  void initState() {
    super.initState();
    initData_1st();
    initController_2nd();
  }

  void initData_1st() {}

  void initController_2nd() {}
}
