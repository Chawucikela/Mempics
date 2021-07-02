import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final int id;
  final String phone;
  final String nickname;
  final String username;
  final int gender;
  final int age;

  UserInfoModel(
    this.id,
    this.phone,
    this.nickname,
    this.username,
    this.gender,
    this.age,
  );

  factory UserInfoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
