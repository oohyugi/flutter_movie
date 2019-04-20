import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:iflix_movie/repo/ApiServices.dart';
import 'package:iflix_movie/model/PostDataMdl.dart';
import 'package:iflix_movie/model/MenuMdl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() => runApp(Test());

class Test extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<MenuMdl>>(
            future: getMenu(),
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.data);
                return Text(snapshot.data[0].categories[0].title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }else{
                return CircularProgressIndicator();
              }

              // By default, show a loading spinner

            },
          ),
        ),
      ),
    );
  }
}