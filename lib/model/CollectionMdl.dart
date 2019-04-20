
import 'dart:convert';

import 'package:iflix_movie/model/ItemsMdl.dart';


class CollectionMdl{
    List<CollectionItems> items=[];
    String title ;
    HeaderMdl header;


    CollectionMdl({ this.header});

    factory CollectionMdl.fromJson(Map<String, dynamic> map) {

//    CollectionsListMdl collectionsListMdl = new CollectionsListMdl();
//    collectionsListMdl.header = HeaderMdl.fromMap(map['header']);
//    collectionsListMdl.title = map['title'];
//    collectionsListMdl.items = ItemsListMdl.fromMapList(map['items']);
      return new CollectionMdl(
//          title : map['title']?? null,
          header: map['hedaer']?? null,

      );

      

}


   static List<CollectionMdl> allCollectionsFromJson(String str) {
      final jsonData = json.decode(str);
      return new List<CollectionMdl>.from(jsonData.map((x) => CollectionMdl.fromJson(x)));
    }



  
}

class ItemsSS {

}

class HeaderMdl {
  String layout;
}