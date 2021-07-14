// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRecordModel _$PostRecordModelFromJson(Map<String, dynamic> json) {
  return PostRecordModel(
    json['shareRecordInfo'] as Map<String, dynamic>,
    json['fileNameList'] as List,
    json['id'] as String,
    json['userId'] as int,
    json['title'] as String,
    json['description'] as String,
    json['shareTime'] as String,
    json['fileName'] as String,
  );
}

Map<String, dynamic> _$PostRecordModelToJson(PostRecordModel instance) =>
    <String, dynamic>{
      'shareRecordInfo': instance.shareRecordInfo,
      'fileNameList': instance.fileNameList,
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'shareTime': instance.shareTime,
      'fileName': instance.fileName,
    };
