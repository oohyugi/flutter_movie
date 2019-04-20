
import 'dart:async';
import 'dart:convert';
import 'dart:io';
class PostDataMdl {
  int userId;
  int id;
  String title;
  String body;

  PostDataMdl({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostDataMdl.fromJson(Map<String, dynamic> json) => new PostDataMdl(
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

PostDataMdl postFromJson(String str) {
  final jsonData = json.decode(str);
  return PostDataMdl.fromJson(jsonData);
}