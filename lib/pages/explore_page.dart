import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mempics/global.dart';
import 'package:mempics/mem_widgets/mem_avatar.dart';
import 'package:mempics/mem_widgets/mem_input_box.dart';
import 'package:mempics/mem_widgets/mem_title_bar.dart';
import 'package:mempics/model/user_info/user_info_model.dart';

import 'base_page.dart';

class ExplorePage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _ExplorePageState();
  }
}

class _ExplorePageState extends BasePageState {
  List searchResultData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100, bottom: 60),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: searchResultData.length,
                itemBuilder: (BuildContext context, int index) {
                  UserInfoModel model =
                      UserInfoModel.fromJson(searchResultData[index]);
                  return userListItem(model);
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: MemTitleBar(
              'Explore',
              additionalBottomWidget: MemInputBox(
                height: 40,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 14),
                borderRadius: BorderRadius.all(Radius.circular(6)),
                hasBorder: false,
                borderWidth: 0.8,
                borderColor: Global.memLightGrey1,
                fillColor: Global.memBgGrey,
                textStyle: TextStyle(
                  fontSize: 14,
                ),
                hintText: 'Search Mempics',
                hintTextStyle: TextStyle(
                  fontSize: 14,
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  (value != null && value.trim().isNotEmpty)
                      ? search(value.trim())
                      : Fluttertoast.showToast(msg: '请输入搜索内容');
                },
              ),
              withShadow: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget userListItem(UserInfoModel model) {
    return Container(
      decoration: BoxDecoration(
        color: Global.memWhite,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          MemAvatar(
            Global.getAvatarUrl(model.id),
            height: 40,
            margin: EdgeInsets.only(right: 10),
            border: Border.all(
              width: 0.6,
              color: Colors.grey[300],
            ),
          ),
          Column(
            children: [
              Text(
                model.nickname,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initData_1st() {
    searchResultData = [];
  }

  @override
  void initController_2nd() {}

  //搜索请求
  Future<void> search(String value) async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 6000,
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(CookieManager(Global.cookieJar));
    Response response = await dio.get(
      '$serverAddress/user/searchuser',
      queryParameters: {
        'keyword': value,
      },
    );
    print('/user/searchuser');
    if (response.data['status'] == 0) {
      searchResultData = response.data['data'];
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: '获取搜索数据失败！');
    }
  }
}
