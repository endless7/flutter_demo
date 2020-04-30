class MemoModel {
  int id;
  String content;
  bool isFinished;
  bool isDeleted;

  MemoModel(this.id, this.content, this.isFinished, this.isDeleted);

  // static MemoModel model

  MemoModel.fromJson(Map<String, dynamic> json)
  {
    id = json["id"];
    content = json["content"];
    isFinished = json["isFinished"];
    isDeleted = json["isDeleted"];
  }

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'content': content,
    'isFinished': isFinished,
    'isDeleted': isDeleted
  };
}