import 'dart:convert';

class TabBarMdl {
  String file;
  String title;


  TabBarMdl({this.file, this.title});
  factory TabBarMdl.fromJson(Map<String, dynamic> map) {
    return new TabBarMdl(
        file: map['file'],
        title: map['title']

    );
  }

  Map<String, dynamic> toJson() => {
    "file": file,
    "title": title,
  };



}

TabBarMdl tabBarFromJson(String str) {
  final jsonData = json.decode(str);
  return TabBarMdl.fromJson(jsonData);
}

String tabBarToJson(TabBarMdl data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<TabBarMdl> allFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<TabBarMdl>.from(jsonData.map((x) => TabBarMdl.fromJson(x)));
}

String allToJson(List<TabBarMdl> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}
