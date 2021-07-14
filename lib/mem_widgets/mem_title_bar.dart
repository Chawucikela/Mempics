import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mempics/global.dart';
import 'package:mempics/mem_widgets/mem_avatar.dart';

///标题栏
class MemTitleBar extends StatefulWidget {
  final String title; //标题
  final Widget titleReplacementWidget; //标题替换组件
  final String avatarImage; //头像
  final bool backAction; //是否开启左侧返回按钮
  final Widget leftWidget; //左侧组件
  final Widget rightWidget; //右侧组件
  final Function leftAction; //左侧按钮点击操作
  final Function rightAction; //右侧按钮点击操作
  final Widget additionalBottomWidget; //额外底部组件
  final bool withShadow; //显示阴影

  MemTitleBar(
    this.title, {
    this.titleReplacementWidget,
    this.avatarImage,
    this.backAction = false,
    this.leftWidget,
    this.rightWidget,
    this.leftAction,
    this.rightAction,
    this.additionalBottomWidget,
    this.withShadow,
  });

  @override
  State<StatefulWidget> createState() {
    return MemTitleBarState();
  }
}

class MemTitleBarState extends State<MemTitleBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Global.screenWidth,
      decoration: BoxDecoration(
        color: Global.memWhite,
        boxShadow: widget.withShadow
            ? [
                BoxShadow(
                  color: Color.fromARGB(30, 0, 0, 0),
                  blurRadius: 2.0,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          //顶部标题栏
          Container(
            width: Global.screenWidth,
            // color: lightGrey,
            height: 50,
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                widget.backAction
                    ? Positioned(
                        left: 0,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(2),
                            child: widget.leftWidget ??
                                Icon(
                                  Icons.arrow_back_rounded,
                                  color: Global.memDarkGrey2,
                                ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    :
                    //左侧按钮
                    widget.leftWidget != null
                        ? Positioned(
                            left: 0,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                width: 30,
                                height: 30,
                                padding: EdgeInsets.all(2),
                                child: widget.leftWidget,
                              ),
                              onTap: widget.leftAction ??
                                  () {
                                    Navigator.pop(context);
                                  },
                            ),
                          )
                        : Container(),
                //标题和头像
                widget.titleReplacementWidget ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.avatarImage != null
                            ?
                            //头像
                            Container(
                                margin: EdgeInsets.all(6),
                                child: MemAvatar(
                                  widget.avatarImage,
                                  width: 80,
                                  height: 80,
                                ),
                                /*ClipOval(
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'image_resources/no_avatar.png',
                                    image: avatarImage,
                                  ),
                                ),*/
                              )
                            : Container(),
                        //标题
                        Container(
                          child: Text(
                            widget.title ?? 'title',
                            style: TextStyle(
                              fontFamily: 'SongTi',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Global.memDarkGrey2,
                            ),
                          ),
                        ),
                      ],
                    ),
                //右侧按钮
                widget.rightWidget != null
                    ? Positioned(
                        right: 0,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(2),
                            child: widget.rightWidget ??
                                Icon(
                                  Icons.check_rounded,
                                  color: Global.memDarkGrey2,
                                ),
                          ),
                          onTap: widget.rightAction,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          widget.additionalBottomWidget ?? Container(),
        ],
      ),
    );
  }
}
