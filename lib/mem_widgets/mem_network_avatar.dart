import 'package:flutter/cupertino.dart';

class MemAvatar extends StatefulWidget {
  final String inputUrl;
  final bool isOnline;

  MemAvatar(
    this.inputUrl, {
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
    return ClipOval(
      child: FadeInImage.assetNetwork(
        fit: BoxFit.cover,
        placeholder: 'res/image/no_avatar.png',
        image: widget.inputUrl,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
