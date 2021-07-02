import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mempics/global.dart';
import 'package:mempics/mem_widgets/mem_title_bar.dart';

import 'base_page.dart';

class MinePage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends BasePageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: MemTitleBar(
              LoggedInUser.userInfoModel.username,
              avatarImage:
                  '$serverAddress/filetransfer/downloadprofilepic?uid=${LoggedInUser.userInfoModel.id}',
            ),
          ),
        ],
      ),
    );
  }
}
