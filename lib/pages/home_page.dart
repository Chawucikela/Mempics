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
      backgroundColor: Global.memWhite,
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
    super.initData_1st();
    itemData = [];
    getData();
  }

  @override
  void initController_2nd() {
    super.initController_2nd();
  }

  Future<void> getData() async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(CookieManager(Global.cookieJar));
    Response response = await dio.get(
      '$serverAddress/share/allmypublish',
    );
    if (response.data['status'] == 0) {
      Fluttertoast.showToast(msg: '获取成功！');
    } else {
      Fluttertoast.showToast(msg: '获取失败！');
    }
  }
}
