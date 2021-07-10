import 'package:flutter/material.dart';

class MemButton extends StatefulWidget {
  final Widget child; //子组件
  final double width; //宽度
  final double height; //高度
  final EdgeInsetsGeometry margin; //外边距
  final EdgeInsetsGeometry padding; //内边距
  final AlignmentGeometry alignment; //内容对齐方式
  final Color fillColor; //填充颜色
  final BoxBorder border; //边框样式
  final BorderRadiusGeometry borderRadius; //边框弧度
  final Function onTap; //单击事件

  MemButton({
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.fillColor,
    this.border,
    this.borderRadius,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _MemButtonState();
  }
}

class _MemButtonState extends State<MemButton> {
  @override
  Widget build(BuildContext context) {
    return
        //触摸区域外层封装，负责处理外边距
        Container(
      margin: widget.margin,
      child:
          //触摸区域
          GestureDetector(
        behavior: HitTestBehavior.opaque,
        child:
            //触摸区域内部
            Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          alignment: widget.alignment,
          decoration: BoxDecoration(
            color: widget.fillColor,
            border: widget.border,
            borderRadius: widget.borderRadius,
          ),
          child: widget.child,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
