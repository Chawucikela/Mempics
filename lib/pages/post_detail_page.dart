import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mempics/mem_widgets/mem_title_bar.dart';
import 'package:mempics/model/post_record/post_record_model.dart';
import 'package:mempics/pages/base_page.dart';

import '../global.dart';

class PostDetailPage extends BasePage {
  final PostRecordModel model;
  final int index;

  PostDetailPage(this.model, this.index);

  @override
  State<StatefulWidget> createState() {
    return _PostDetailPageState();
  }
}

class _PostDetailPageState extends BasePageState<PostDetailPage> {
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
              child: Container(
                  margin: EdgeInsets.only(top: Global.statusBarHeight),
                  child: FadeInImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('res/image/loading.gif'),
                    image: NetworkImage(Global.getPostImageUrl(
                        widget.model.id, widget.model.fileName)),
                  ),
                ),
            )
          ),
          Positioned(
            top: Global.statusBarHeight,
            child: MemTitleBar(
              widget.model.title,
              withShadow: false,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initData_1st() {}

  @override
  void initController_2nd() {}
}
