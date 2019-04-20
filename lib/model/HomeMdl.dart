
import 'dart:convert';
import 'CollectionMdl.dart';
class HomeMdl {


  String id;
  int timestamp;
  List<CollectionMdl> collections = [];


  HomeMdl({this.id, this.timestamp, this.collections});

  factory HomeMdl.fromJson(Map<String, dynamic> map) {
    return new HomeMdl(
    id : map['id'],
    timestamp : map['timestamp'],
    collections : map['collections']!=null ?allCollectionsFromJson(map['collections']).toList():[] ,
  );
  }


  }


 List<CollectionMdl> allCollectionsFromJson(String str) {
final jsonData = json.decode(str);
return new List<CollectionMdl>.from(jsonData.map((x) => CollectionMdl.fromJson(x)));
}

HomeMdl homeFromJson(String body) {
  final jsonData = json.decode(body);
  return HomeMdl.fromJson(jsonData);
}

