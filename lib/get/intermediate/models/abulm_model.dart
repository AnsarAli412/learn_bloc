import 'dart:convert';

AlbumModel albumModelFromJson(String str) => AlbumModel.fromJson(json.decode(str));

String albumModelToJson(AlbumModel data) => json.encode(data.toJson());

class AlbumModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  AlbumModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
