import 'package:iflix_movie/model/ContentMdl.dart';
import 'package:iflix_movie/model/NewHomeMdl.dart';
import 'package:iflix_movie/model/TabBarMdl.dart';
import 'package:flutter/material.dart';
import 'package:iflix_movie/model/HomeMdl.dart';
import 'package:iflix_movie/model/CollectionMdl.dart';
import 'package:iflix_movie/repo/ApiServices.dart';
import 'package:iflix_movie/view/DetailMain.dart';

class HomeView extends StatelessWidget {
  var urlname = "";
  var title = "";

  HomeView(TabBarMdl mdl) {
    urlname = mdl.file;
    title = mdl.title;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

       body: Center(child: callApi(urlname, title)),
//      home : HomeContent(null)

        );
  }
}

FutureBuilder callApi(String urlname, String title) {
  //call api home
  if (urlname.contains("web")) {
    return FutureBuilder<NewHomeMdl>(
        future: getHome(urlname),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
//                    print(snapshot.data);
//                    return SingleChildScrollView(
//                      child:Text(converData.collections[2].title) ,
//
//                    );
            return HomeContent(snapshot.data.collections);
          } else {
            return CircularProgressIndicator();
          }
        });
  } else {
    return FutureBuilder<List<ContentMdl>>(
        future: getContent(urlname),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
//                    print(snapshot.data);
//                    return SingleChildScrollView(
//                      child:Text(converData.collections[2].title) ,
//
//                    );

            return HomeContent(mappingDataContent(snapshot.data));
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

List<CollectionsListBean> mappingDataContent(List<ContentMdl> data) {
  List<String> listChannels = [];
  for (var item in data) {
    var channel = item.channel;

    if (channel != null && channel.isNotEmpty) {
      if (!listChannels.contains(channel)) {
        listChannels.add(channel);
      }
    }
  }

  print(listChannels);
  List<CollectionsListBean> listColection = [];
  for (var channel in listChannels) {
    List<ContentMdl> listContent = [];

    for (var content in data) {
      if (channel == content.channel) {
        listContent.add(content);
      }
    }
    listColection.add(CollectionsListBean(null, channel, null, listContent));
  }

  print(listColection);

  print("mapping" + listColection.toString());

  return listColection;
}

class HomeContent extends StatelessWidget {
  List<CollectionsListBean> mData;

  HomeContent(List<CollectionsListBean> data) {
    this.mData = data;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: ListView(
        children: makePopularWidget(mData),
//      makePopularWidget("Trending"),
//      makePopularWidget("asu")
      ),
    );
  }
}

final TextStyle topMenuStyle = new TextStyle(
    fontFamily: 'Avenir next',
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w600);

List<Widget> makePopularWidget(List<CollectionsListBean> mdata) {
  List<Container> movieList = [];
  List<ContentMdl> contents = [];

  if (mdata != null) {
    print(mdata);
    for (var item in mdata) {
      if (item.title != "kosong" &&
          (item.items != null && item.items.isNotEmpty ||
              item.contents != null && item.contents.isNotEmpty)) {
        movieList.add(new Container(
//    padding: EdgeInsets.only(left: 14, right: 0),
          height: 220,

          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  alignment: Alignment.topLeft,
                  child: Text(item.title, style: topMenuStyle),
//              ]
                ),
              ),
              Container(
                height: 200,
                child: ListView(
                    padding: EdgeInsets.only(top: 14, bottom: 14),
                    scrollDirection: Axis.horizontal,
                    //shrinkWrap: true,
                    children: makeItems(item)),
              )
            ],
          ),
        ));
      }
    }
  }

  return movieList;
}

makeTitle() {}

List<Widget> makeItems(CollectionsListBean data) {
  List<Container> movieList = [];
  if (data.items != null && data.items.isNotEmpty) {
    for (var item in data.items) {
      movieList.add(new Container(
//      padding: EdgeInsets.all(3),
//      height: 200,
          width: 140,

//      child: Image.network('https://commodusprod.hooq.tv/cdnimagesprod/ID/8cae4f6c-c926-4184-b1a7-8e04470e9e3e/B93DBE8BAC1D71FCBF5547F018619941.jpg?'),
          child: CustomCard(item, null)));
    }
  } else {
    if (data.contents != null && data.contents.isNotEmpty) {
      for (var content in data.contents) {
        movieList.add(new Container(
//      padding: EdgeInsets.all(3),
//      height: 200,
            width: 140,

//      child: Image.network('https://commodusprod.hooq.tv/cdnimagesprod/ID/8cae4f6c-c926-4184-b1a7-8e04470e9e3e/B93DBE8BAC1D71FCBF5547F018619941.jpg?'),
            child: CustomCard(null, content)));
      }
    }
  }
  return movieList;
}

class CustomCard extends StatelessWidget {
  ItemsListBean mItem;
  ContentMdl mContent;
  String imgUrl = "";
  String mTitle = "";
  var baseImageUrl = "https://iflix-images.akamaized.net/";

  CustomCard(ItemsListBean item, ContentMdl content) {
    mItem = item;
    mContent = content;
    if (mItem != null) {
      imgUrl = '$baseImageUrl${mItem.imagePackId}_s_300x450';
      mTitle = mItem.title.en;
    } else {
      if (mContent != null) {
        imgUrl = '$baseImageUrl${mContent.imagePackId}_s_300x450';
        mTitle = mContent.title.en_US;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
//        width: 130.0,
        padding: EdgeInsets.only(left: 8),
        child: Card(
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> DetailApp(mItem,mContent))
                );
                },
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
//            new ClipRRect(
//              borderRadius: new BorderRadius.circular(8.0),
//              child: ,
//            )
                  Container(
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                      width: 140,
                      height: 120,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(mTitle,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
//                  Text(mItem.contentType,style: TextStyle(
//                    fontSize: 11,
//                    color: Colors.black38
//                  ),maxLines: 1,overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                  ),
                ],
              ),
            )
         )
//      )
//          new Padding(
//              padding: new EdgeInsets.all(7.0),
//              child: new Row(
//                children: <Widget>[
//                  new Padding(
//                    padding: new EdgeInsets.all(7.0),
//                    child: new Icon(Icons.thumb_up),
//                  ),
//                  new Padding(
//                    padding: new EdgeInsets.all(7.0),
//                    child: new Text(
//                      'Like', style: new TextStyle(fontSize: 18.0),),
//                  ),
//                  new Padding(
//                    padding: new EdgeInsets.all(7.0),
//                    child: new Icon(Icons.comment),
//                  ),
//                  new Padding(
//                    padding: new EdgeInsets.all(7.0),
//                    child: new Text(
//                        'Comments', style: new TextStyle(fontSize: 18.0)),
//                  )
//
//                ],
//              )
//          )
//        ],
//      ),
        );
  }
}
