import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final int id; //用户id
  final String phone; //手机号
  final String nickname; //昵称
  final String username; //用户名
  final int gender; //性别
  final int age; //年龄
  int postAmount; //发布的动态数
  int followerAmount; //粉丝数
  int followingAmount; //关注数

  UserInfoModel(
    this.id,
    this.phone,
    this.nickname,
    this.username,
    this.gender,
    this.age,
    this.postAmount,
    this.followerAmount,
    this.followingAmount,
  );

  factory UserInfoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
