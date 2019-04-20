import 'package:iflix_movie/model/ContentMdl.dart';
import 'package:iflix_movie/model/NewHomeMdl.dart';
import 'package:flutter/material.dart';
import 'package:iflix_movie/repo/ApiServices.dart';
import 'package:iflix_movie/model/MenuMdl.dart';
import 'package:iflix_movie/model/TabBarMdl.dart';
//void DetailMain() => runApp(DetailApp());
ItemsListBean mItem;
ContentMdl mContent;
var desc = "";
var title = "";
var subTitle = "";
var url = "";
var urlThumb = '';
var baseImageUrl = "https://iflix-images.akamaized.net/";
class DetailApp extends StatelessWidget {


  DetailApp(ItemsListBean item, ContentMdl content){
    mItem = item;
    mContent = content;
    if(mItem !=null){
      desc = mItem.description.en;
      title = mItem.title.en;
      subTitle = mItem.contentType;
      url = '$baseImageUrl${mItem.imagePackId}_s_1600x478';
      urlThumb = '$baseImageUrl${mItem.imagePackId}_s_300x450';

    }else{
      desc = mContent.description.en_US;
      title = mContent.title.en_US;
      subTitle = mContent.channel;
      url = '$baseImageUrl${mContent.imagePackId}_s_1600x478';
      urlThumb = '$baseImageUrl${mContent.imagePackId}_s_300x450';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Movie App",
      theme: ThemeData(
//        primaryColor: Colors.black
        primaryColor: Colors.white,
      ),
      home: Scaffold(
      appBar: AppBar(
          title: Text("Iflix",style: TextStyle(color: Colors.red)),
          leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.of(context).pop(),
          ),

      ),
      body:  SingleChildScrollView(
        child: DetailContainer(),
      ),

      )
    );
  }
}




Container DetailContainer() {

  print(url);
  return Container(

    child: Column(

      children: <Widget>[
        Image.network(
          url,
          height: 180,
          fit: BoxFit.fitHeight,
        ),
        Container(

          margin: EdgeInsets.only(top: 14,left: 14,right: 14),
          child:  Row( // vertical
            crossAxisAlignment: CrossAxisAlignment.start,

//              direction: Axis.horizontal,
            children: <Widget>[
              Image.network(
                urlThumb,
                height: 120,
                fit: BoxFit.fitHeight,
              ),
              Expanded(child:
              Container(
                margin: EdgeInsets.only(left: 12,top: 4),

                child:  Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child:Text(title,style: TextStyle(fontSize: 21)),
                    ),


                    Container(
                      child: roundedText(subTitle),
                    )



                  ],
                ),
              )
              ),

//              Text(mItem.title.en,style: TextStyle(fontSize: 21),maxLines: 3,)



            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(14),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Description",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Container(
                margin: EdgeInsets.only(top: 8),
                child:  Text(desc),
              )

            ],
          ),
        )

      ],
    ),
  );
}

Widget roundedText(String contentType) {

   return Container(

      decoration: BoxDecoration(color: Colors.white30,
          border: Border.all( color: Colors.black26, width:1),borderRadius: BorderRadius.circular(24)),
      padding:EdgeInsets.only(left: 8,top: 4,right: 8,bottom: 4),
      child: new Text( contentType)


    );

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

//          return ContainerCustom(snapshot.data);
          return Text("masuk");
        }
        else {
          return CircularProgressIndicator();
        }

        // By default, show a loading spinner

      },
    );
  }



}

