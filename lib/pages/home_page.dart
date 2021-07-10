import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mempics/global.dart';
import 'package:mempics/pages/base_page.dart';

class HomePage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageState<HomePage> {
  List itemData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.separated(
            itemBuilder: (context, index) {
              return itemView(index);
            },
            separatorBuilder: (context, index) {
              return Container();
            },
            itemCount: itemData.length,
          )
        ],
      ),
    );
  }

  Widget itemView(int index) {
    return Container(
      child: Column(
        children: [
          Text(itemData[index]['title']),
        ],
      ),
    );
  }

  @override
  void initData_1st() {
    itemData = [];
  }

  @override
  void initController_2nd() {
  }
}
