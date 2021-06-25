import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mempics/pages/base_page.dart';
import 'package:mempics/global_constants.dart';
import 'package:mempics/pages/home_page.dart';
import 'package:mempics/mem_widgets/mem_input_box.dart';

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
    super.initData_1st();
  }

  @override
  void initController_2nd() {
    super.initController_2nd();
    _phoneTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
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
                  width: GlobalConstants.screenWidth,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: FlatButton(
                    color: GlobalConstants.memBlue,
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        color: GlobalConstants.memWhite,
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
    Response response = await dio.post(
      '$serverAddress/user/login',
      data: formData,
    );
    if (response.data['status'] == 0) {
      Fluttertoast.showToast(msg: '登录成功！');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePage();
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
