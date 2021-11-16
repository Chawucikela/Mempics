import 'package:flutter/material.dart';
import 'package:mempics/model/post_record/post_record_model.dart';
import 'package:mempics/pages/post_detail_page.dart';
import 'package:mempics/utils/fade_animation_route.dart';

import '../global.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key});
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  @override
  void initState() {
    super.initState();
    initData_1st();
    initController_2nd();
  }

  void initData_1st();

  void initController_2nd();

  //动态item样式
  Widget postItem(PostRecordModel model, int index) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                child: FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('res/image/loading.gif'),
                  image: NetworkImage(
                      Global.getPostImageUrl(model.id, model.fileName)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                model.title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PostDetailPage(model, index);
            },
          ),
        );
      },
    );
  }
}
