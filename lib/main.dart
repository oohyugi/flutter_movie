import 'package:flutter/material.dart';
import 'view/homeview.dart';
import 'view/testdata.dart';
import 'package:iflix_movie/repo/ApiServices.dart';
import 'package:iflix_movie/model/MenuMdl.dart';
import 'package:iflix_movie/model/TabBarMdl.dart';
void main() => runApp(MovieApp());


class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Movie App",
      theme: ThemeData(
//        primaryColor: Colors.black
      ),
      home: IflixTabBar()
    );
  }
}

class IflixTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  FutureBuilder<List<TabBarMdl>>(
      future: getMenuBar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data);

          return ContainerCustom(snapshot.data);
        }
        else {
          return CircularProgressIndicator();
        }

        // By default, show a loading spinner

      },
    );
  }



}

Widget ContainerCustom(List<TabBarMdl> data) {


 return new DefaultTabController(

      length: data.length,
      child: Theme(
      data: ThemeData(

      primaryColor: Colors.white,
//            accentColor: Colors.redAccent,
//            secondaryHeaderColor: Colors.black38,
//            brightness: Brightness.dark
  ),
  child:
    Scaffold(
      appBar: AppBar(
      title: Text("Iflix",style: TextStyle(color: Colors.red),),
     bottom: setupTab(data)
 ),

  body: tabBarView(data),
  )


  ),
  );
}


tabBarView(List<TabBarMdl> data) {
  return TabBarView(children: bodyTab(data)
  );
}

List<Widget> bodyTab(List<TabBarMdl> data) {
  List<Center> bodys = [];

//  bodys.add(Center(child: Text("Page 3")));
//  bodys.add(Center(child: Text("Page 3")));
//  bodys.add(Center(child: Text("Page 3")));
//  bodys.add(Center(child: Text("Page 3")));
//  bodys.add(Center(child: Text("Page 3")));
//  bodys.add(Center(child: Text("Page 3")));
//  Test(),
//  Center(child:HomeView()),
//  Center(child: Text("Page 3")),
//  Center(child: Text("Page 4")),
//  Center(child: Text("Page 5"))
  for (var item in data) {

//    if(item.title.contains("All") || item.title.contains("Pemilu") || item.title.contains("Magic")) {
      bodys.add(Center(child: HomeView(item)));
//    }else{
//      bodys.add(Center(child: Center(child: Text("Page 5"))));
//    }
  }
  return bodys;
}


TabBar setupTab(List<TabBarMdl> data) {
  List<Tab> tabs = [];
//  tabs.add( Tab(icon: Icon(Icons.home)));
//  tabs.add(Tab(icon: Icon(Icons.home)));
//  tabs.add(Tab(icon: Icon(Icons.rss_feed)));
//  tabs.add(Tab(icon: Icon(Icons.live_tv)));
//  tabs.add(Tab(icon: Icon(Icons.trending_up)));
//  tabs.add(Tab(icon: Icon(Icons.file_download)));
//
//
  for (var item in data) {
    tabs.add(new Tab(text: item.title));
  }

  return TabBar(

    tabs: tabs,
    unselectedLabelColor: Colors.black26,
    labelColor: Colors.redAccent,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.redAccent,
    isScrollable: true,

  );
}
