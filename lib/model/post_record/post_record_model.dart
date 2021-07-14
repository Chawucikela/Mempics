import 'package:json_annotation/json_annotation.dart';

part 'post_record_model.g.dart';

@JsonSerializable()
class PostRecordModel {
  final Map shareRecordInfo;
  final List fileNameList;
  final String id;
  final int userId;
  final String title;
  final String description;
  final String shareTime;
  final String fileName;

  PostRecordModel(
    this.shareRecordInfo,
    this.fileNameList,
    this.id,
    this.userId,
    this.title,
    this.description,
    this.shareTime,
    this.fileName,
  );
  
  factory PostRecordModel.fromJson(Map<String, dynamic> srcJson) =>
      _$PostRecordModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PostRecordModelToJson(this);
}
