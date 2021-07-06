import 'package:flutter/cupertino.dart';

class MemAvatar extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final String inputUrl;
  final bool isOnline;

  MemAvatar(
    this.inputUrl, {
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.isOnline,
  });

  @override
  State<StatefulWidget> createState() {
    return MemAvatarState();
  }
}

class MemAvatarState extends State<MemAvatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: ClipOval(
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('res/image/no_avatar.png'),
          image: NetworkImage(widget.inputUrl, headers: {}),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
