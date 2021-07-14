import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global.dart';

class MemInputBox extends StatefulWidget {
  final double width;
  final double height;
  final bool hasBorder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;
  final TextStyle hintTextStyle;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String) onSubmitted;
  final TextInputType textInputType;
  final bool obscureText;

  MemInputBox({
    this.width,
    this.height,
    this.hasBorder = true,
    this.margin,
    this.padding,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.textStyle,
    this.hintTextStyle,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.onSubmitted,
    this.textInputType,
    this.obscureText = false,
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
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.fillColor ?? Global.memBgGrey,
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
        onSubmitted: widget.onSubmitted,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText ?? false,
        style: widget.textStyle ??
            TextStyle(
              color: Global.memDarkGrey1,
              fontSize: 18,
            ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: widget.hintText ?? '',
          hintStyle: widget.hintTextStyle ??
              TextStyle(
                fontSize: 16,
                color: Global.memLightGrey2,
              ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
