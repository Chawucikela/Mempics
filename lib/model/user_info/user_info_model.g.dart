// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return UserInfoModel(
    json['id'] as int,
    json['phone'] as String,
    json['nickname'] as String,
    json['username'] as String,
    json['gender'] as int,
    json['age'] as int,
  );
}

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'nickname': instance.nickname,
      'username': instance.username,
      'gender': instance.gender,
      'age': instance.age,
    };
