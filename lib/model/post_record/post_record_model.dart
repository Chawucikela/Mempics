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
}
