import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mempics/pages/base_page.dart';
import 'package:mempics/global_constants.dart';

class HomePage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalConstants.memBlue,
      body: Stack(),
    );
  }

  @override
  void initData_1st() {
    super.initData_1st();
  }

  @override
  void initController_2nd() {
    super.initController_2nd();
  }
}
