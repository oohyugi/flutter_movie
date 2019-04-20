import 'dart:convert';

import 'package:iflix_movie/model/MenuMdl.dart';

class Transformers<T>{

  T modelFromJson(String str,T) {
    final jsonData = json.decode(str);
    return T.fromJson(jsonData);
  }

  String modelToJson(dynamic data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }


  List<MenuMdl> allMenuFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<MenuMdl>.from(jsonData.map((x) => MenuMdl.fromJson(x)));
  }

  String allmenuToJson(List<MenuMdl> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
  }
}