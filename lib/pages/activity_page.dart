import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mempics/mem_widgets/mem_title_bar.dart';

import 'base_page.dart';

class ActivityPage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _ActivityPageState();
  }
}

class _ActivityPageState extends BasePageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: MemTitleBar(
              'Activity',
              withShadow: false,
            ),
          ),
        ],
      ),
    );
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
