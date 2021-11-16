import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mempics/global.dart';
import 'package:mempics/mem_widgets/mem_title_bar.dart';
import 'package:mempics/model/post_record/post_record_model.dart';
import 'package:mempics/pages/base_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageState<HomePage> {
  List postsData;

  RefreshController _homeListRefreshController;

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
            child: SmartRefresher(
              controller: _homeListRefreshController,
              onRefresh: () async {
                await getData();
                setState(() {});
              },
              header: WaterDropHeader(),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: MemTitleBar(
              'Mempics',
              withShadow: false,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> initData_1st() async {
    postsData = [];
    await getData();
    setState(() {});
  }

  @override
  void initController_2nd() {
    _homeListRefreshController = new RefreshController();
  }

  //获取已关注用户的post
  Future<void> getData() async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(CookieManager(Global.cookieJar));
    Response response = await dio
        .get(
          '$serverAddress/share/friendspublish',
        )
        .timeout(Duration(milliseconds:1000),);
    print('/share/friendspublish');
    if (response.data['status'] == 0) {
      // Fluttertoast.showToast(msg: '获取post列表成功！');
      print('获取post列表成功！');
      postsData = response.data['data'];
      if (_homeListRefreshController.isRefresh)
        _homeListRefreshController.refreshCompleted();
    } else {
      // Fluttertoast.showToast(msg: '获取post列表失败！');
      print('获取post列表失败！');
      if (_homeListRefreshController.isRefresh)
        _homeListRefreshController.refreshCompleted();
    }
  }
}
