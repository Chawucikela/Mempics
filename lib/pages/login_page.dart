import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mempics/global.dart';
import 'package:mempics/mem_widgets/mem_input_box.dart';
import 'package:mempics/model/user_info/user_info_model.dart';
import 'package:mempics/pages/base_page.dart';
import 'package:mempics/pages/main_frame_page.dart';

class LoginPage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BasePageState<LoginPage> {
  TextEditingController _phoneTextEditingController,
      _passwordTextEditingController,
      _ipAddressTextEditingController;

  @override
  void initData_1st() {
  }

  @override
  void initController_2nd() {
    _phoneTextEditingController = TextEditingController(text: '13168538283');
    _passwordTextEditingController = TextEditingController(text: '123456');
    _ipAddressTextEditingController =
        TextEditingController(text: serverAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'Mempics',
                    style: TextStyle(
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                      color: Global.memDarkGrey2,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 30),
                ),
                //手机号输入框
                MemInputBox(
                  controller: _phoneTextEditingController,
                  hasBorder: false,
                  hintText: 'Phone number',
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                //密码输入框
                MemInputBox(
                  controller: _passwordTextEditingController,
                  hasBorder: false,
                  hintText: 'Password',
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                //IP地址输入框
                MemInputBox(
                  controller: _ipAddressTextEditingController,
                  hasBorder: false,
                  hintText: 'IP adress',
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                //登录按钮
                Container(
                  width: Global.screenWidth,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: FlatButton(
                    color: Global.memBlue,
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        color: Global.memWhite,
                      ),
                    ),
                    onPressed: () {
                      serverAddress = _ipAddressTextEditingController.text;
                      _login();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //登录请求
  Future<void> _login() async {
    Map<String, dynamic> param = {
      'phone': _phoneTextEditingController.text.trim(),
      'password': _passwordTextEditingController.text.trim(),
    };
    FormData formData = FormData.fromMap(param);
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(CookieManager(Global.cookieJar));
    Response response = await dio.post(
      '$serverAddress/user/login',
      data: formData,
    );
    print('/user/login');
    if (response.data['status'] == 0) {
      Fluttertoast.showToast(msg: '登录成功！');
      UserInfoModel userInfoModel =
          UserInfoModel.fromJson(response.data['data']);
      LoggedInUser.loggedIn(userInfoModel);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MainFramePage();
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _phoneTextEditingController.clear();
    _passwordTextEditingController.clear();
    _ipAddressTextEditingController.clear();
  }
}
