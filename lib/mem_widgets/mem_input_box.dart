import 'package:flutter/material.dart';

import '../global_constants.dart';

class MemInputBox extends StatefulWidget {
  bool hasBorder = true;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry padding;
  Color backgroundColor;
  Color borderColor;
  double borderWidth;
  BorderRadiusGeometry borderRadius;
  TextStyle textStyle;
  TextStyle hintTextStyle;
  String hintText;
  TextEditingController controller;
  TextInputAction textInputAction;
  TextInputType textInputType;
  bool obscureText = false;

  MemInputBox({
    this.hasBorder,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.textStyle,
    this.hintTextStyle,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.obscureText,
  });

  @override
  State<StatefulWidget> createState() {
    return _MemInputBoxState();
  }
}

class _MemInputBoxState extends State<MemInputBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? GlobalConstants.memBgGrey,
        border: widget.hasBorder
            ? Border.all(
                width: widget.borderWidth ?? 0.5,
                color: widget.borderColor ?? Colors.grey,
              )
            : null,
        borderRadius: widget.borderRadius ??
            BorderRadius.all(
              Radius.circular(0),
            ),
      ),
      child: TextField(
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText??false,
        style: widget.textStyle ??
            TextStyle(
              color: GlobalConstants.memDarkGrey1,
              fontSize: 18,
            ),
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          hintStyle: widget.hintTextStyle ??
              TextStyle(
                fontSize: 16,
                color: GlobalConstants.memLightGrey2,
              ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
