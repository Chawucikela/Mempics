import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mempics/global.dart';
import 'package:mempics/mem_widgets/mem_button.dart';
import 'package:mempics/mem_widgets/mem_avatar.dart';
import 'package:mempics/mem_widgets/mem_title_bar.dart';
import 'package:mempics/model/post_record/post_record_model.dart';

import 'base_page.dart';

class MinePage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends BasePageState {
  List followersData; //粉丝数据
  List followingData; //关注数据
  List postsData; //我发布的所有post数据

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 60,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //头像
                        MemAvatar(
                          Global.getAvatarUrl(LoggedInUser.userInfoModel.id),
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.only(right: 16),
                          isOval: true,
                          border: Border.all(
                            width: 0.6,
                            color: Colors.grey[300],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //发布动态数
                              Expanded(
                                child: indexItem(
                                  'Posts',
                                  postsData.length.toString(),
                                ),
                              ),
                              //粉丝数
                              Expanded(
                                child: indexItem('Followers',
                                    followersData.length.toString()),
                              ),
                              //关注数
                              Expanded(
                                child: indexItem('Following',
                                    followingData.length.toString()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //昵称和简介
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            LoggedInUser.userInfoModel.nickname,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 2),
                        ),
                        Container(
                          child: Text(
                            "A biography, or simply bio, is a detailed description of a person's life.",
                            style: TextStyle(fontSize: 12, height: 1.5),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 2),
                        ),
                      ],
                    ),
                  ),
                  //个人信息编辑按钮
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: MemButton(
                      width: Global.screenWidth,
                      alignment: Alignment.center,
                      border: Border.all(
                        width: 0.8,
                        color: Global.memLightGrey1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: 'Edit Profile',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        itemCount: postsData.length,
                        itemBuilder: (BuildContext context, int index) {
                          PostRecordModel model =
                              PostRecordModel.fromJson(postsData[index]);
                          return postItem(model, index);
                        },
                        staggeredTileBuilder: (int index) {
                          return StaggeredTile.fit(2);
                        },
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: MemTitleBar(
              LoggedInUser.userInfoModel.username.toUpperCase(),
              withShadow: false,
            ),
          ),
        ],
      ),
    );
  }

  //动态、粉丝、关注数 组件
  Widget indexItem(String title, String value) {
    return Container(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> initData_1st() async {
    followersData = [];
    followingData = [];
    await getFollowers();
    await getFollowing();
    await getData();
    setState(() {});
  }

  @override
  void initController_2nd() {}

  //获取粉丝数据
  Future<void> getFollowers() async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(CookieManager(Global.cookieJar));
    Response response = await dio.get(
      '$serverAddress/user/getfollower',
    );
    print('/user/getfollower');
    if (response.data['status'] == 0) {
      Fluttertoast.showToast(msg: '获取Follower数据成功！');
      followersData = response.data['data'];
      LoggedInUser.userInfoModel.followerAmount = followersData.length;
    } else {
      Fluttertoast.showToast(msg: '获取Follower数据失败！');
    }
  }

  //获取关注数据
  Future<void> getFollowing() async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(CookieManager(Global.cookieJar));
    Response response = await dio.get(
      '$serverAddress/user/getfollowing',
    );
    print('/user/getfollowing');
    if (response.data['status'] == 0) {
      Fluttertoast.showToast(msg: '获取Following数据成功！');
      followingData = response.data['data'];
      LoggedInUser.userInfoModel.followingAmount = followingData.length;
    } else {
      Fluttertoast.showToast(msg: '获取Following数据失败！');
    }
  }

  //获取我发布的所有post
  Future<void> getData() async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(CookieManager(Global.cookieJar));
    Response response = await dio.get(
      '$serverAddress/share/allmypublish',
    );
    print('/share/allmypublish');
    if (response.data['status'] == 0) {
      Fluttertoast.showToast(msg: '获取我的post列表成功！');
      postsData = response.data['data'];
    } else {
      Fluttertoast.showToast(msg: '获取我的post列表失败！');
    }
  }
}
