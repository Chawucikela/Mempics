import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mempics/global.dart';
import 'package:mempics/pages/activity_page.dart';
import 'package:mempics/pages/explore_page.dart';
import 'package:mempics/pages/mine_page.dart';

import 'base_page.dart';
import 'home_page.dart';

///主页框架
class MainFramePage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _MainFramePageState();
  }
}

class _MainFramePageState extends BasePageState<MainFramePage> {
  int currentPage;

  @override
  void initData_1st() {
    // TODO: implement initData
    currentPage = 0;
  }

  @override
  void initController_2nd() {
    // TODO: implement initController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global.memBgGrey,
      body: Stack(
        children: [
          //页面切换器
          pageSwitcher(),
          //底部导航栏（置底）
          Positioned(
            bottom: 0,
            child: bottomNavigator(),
          ),
        ],
      ),
    );
  }

  //页面切换器
  Widget pageSwitcher() {
    List<Widget> pages = [
      //首页
      HomePage(),
      //探索
      ExplorePage(),
      //活动
      ActivityPage(),
      //个人
      MinePage(),
    ];

    return Container(
      padding: EdgeInsets.only(top: Global.statusBarHeight),
      child: IndexedStack(
        index: currentPage,
        children: pages,
      ),
    );
  }

  //底部导航栏
  Widget bottomNavigator() {
    return Container(
      // color: white,
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Global.memWhite,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //首页tab
          bottomNavigatorTab(0),
          //工单tab
          bottomNavigatorTab(1),
          //添加按钮
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                // color: Colors.amber,
                alignment: Alignment.center,
                child: Icon(
                  Icons.add_circle_rounded,
                  color: Color.fromARGB(255, 19, 108, 250),
                  size: 54,
                ),
              ),
              onTap: add,
            ),
          ),
          //资产tab
          bottomNavigatorTab(2),
          //消息tab
          bottomNavigatorTab(3),
        ],
      ),
    );
  }

  //底部导航栏tab
  Widget bottomNavigatorTab(int index) {
    List<Map<String, dynamic>> tabInfo = [
      {'icon': Icons.home_rounded, 'label': 'Home'},
      {'icon': Icons.assignment_rounded, 'label': 'Explore'},
      {'icon': Icons.devices_rounded, 'label': 'Activity'},
      {'icon': Icons.chat_rounded, 'label': 'Mine'},
    ];
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //   child: Icon(
              //     tabInfo[index]['icon'],
              //     size: 24,
              //     color: currentPage == index
              //         ? Global.memDarkGrey2
              //         : Global.memDarkGrey1,
              //   ),
              // ),
              Text(
                tabInfo[index]['label'],
                style: TextStyle(
                  color: currentPage == index
                      ? Global.memDarkGrey2
                      : Global.memDarkGrey1,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SongTi',
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (currentPage != index) {
            setState(() {
              currentPage = index;
              print('当前页面为：${tabInfo[index]['label']}');
            });
          }
        },
      ),
    );
  }

  //加号按钮点击事件
  void add() {
    showModalBottomSheet(
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              child: Ink(
                child: InkWell(
                  child: Container(
                    child: Text(
                      '新增报障工单',
                      style: TextStyle(
                        color: Global.memBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SongTi',
                      ),
                    ),
                    height: 48,
                    alignment: Alignment.center,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return WorkOrderOptionsPage(
                    //         WorkOrderType.FAULT_REPORT,
                    //         WorkOrderActionType.ADD,
                    //       );
                    //     },
                    //   ),
                    // );
                    // Navigator.pop(this.context);
                  },
                ),
                color: Global.memWhite,
              ),
            ),
            Divider(
              height: 0.6,
              thickness: 0.6,
              color: Global.memBgGrey,
            ),
            Material(
              child: Ink(
                child: InkWell(
                  child: Container(
                    child: Text(
                      '新增业务工单',
                      style: TextStyle(
                        color: Global.memBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SongTi',
                      ),
                    ),
                    height: 48,
                    alignment: Alignment.center,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return WorkOrderOptionsPage(
                    //         WorkOrderType.BUSINESS,
                    //         WorkOrderActionType.ADD,
                    //       );
                    //     },
                    //   ),
                    // );
                    // Navigator.pop(this.context);
                  },
                ),
                color: Global.memWhite,
              ),
            ),
            Divider(
              height: 0.6,
              thickness: 0.6,
              color: Global.memBgGrey,
            ),
            Material(
              child: Ink(
                child: InkWell(
                  child: Container(
                    child: Text(
                      '发送消息',
                      style: TextStyle(
                        color: Global.memBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SongTi',
                      ),
                    ),
                    height: 48,
                    alignment: Alignment.center,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MessageSendingPage(false);
                    //     },
                    //   ),
                    // );
                  },
                ),
                color: Global.memWhite,
              ),
            ),
          ],
        );
      },
    );
  }
}
