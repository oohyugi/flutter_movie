import 'dart:convert';
import 'dart:async';
import 'package:iflix_movie/model/ContentMdl.dart';
import 'package:iflix_movie/model/NewHomeMdl.dart';
import 'package:http/http.dart' as http;
import 'package:iflix_movie/model/HomeMdl.dart';
import 'package:iflix_movie/model/PostDataMdl.dart';
import 'package:iflix_movie/model/MenuMdl.dart';
import 'package:iflix_movie/model/TabBarMdl.dart';
import 'package:flutter/services.dart' show rootBundle;



var baseUrl = "https://iflix-data.akamaized.net/5/id/adults/";


Future<NewHomeMdl> getHome(link) async{
  String url = '$baseUrl$link.json';
  print(url);
  final response = await http.get(url);

  if(response.statusCode ==200){
    var parsedResponse = newHomeFromJson(response.body.toString());
    return parsedResponse;
  }

//  print(" Youtube JSON PARSING LOG: " + parsedResponse.toString());



}

Future<List<ContentMdl>> getContent(link) async{
  String url = '$baseUrl$link.json';
  print(url);
  final response = await http.get(url);

  var parsedResponse = contentMdlFromJson(response.body);
//  print(" Youtube JSON PARSING LOG: " + parsedResponse.toString());
  return parsedResponse;


}




Future<PostDataMdl> getPost() async{
  String url = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get('$url/1');
  return postFromJson(response.body);


}

Future<List<MenuMdl>> getMenu() async{
  String url = 'https://iflix-data.akamaized.net/5/id/adults/sections/menu.json';
  final response = await http.get(url);
  print(response.body);
  return allMenuFromJson(response.body);
}

Future<List<TabBarMdl>> getMenuBar() async{
//  String url = 'https://sticktab.sehentak.com/dl/MuaEsj1AJM/MuaEsj1AJM.json';
//  final response = await http.get(url);
//  print(response.body);
final response = await rootBundle.loadString('assets/tabmenu.json');


  return allFromJson(response);
//  return allFromJson(response.body);
}








