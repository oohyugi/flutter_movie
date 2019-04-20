import 'dart:convert';

import 'package:iflix_movie/model/ContentMdl.dart';


class NewHomeMdl {
  String id;
  int timestamp;
  ConfigBean config;
  List<CarouselListBean> carousel = [];
  List<CollectionsListBean> collections;

//
  NewHomeMdl({this.id, this.timestamp, this.config,this.collections});

  factory NewHomeMdl.fromJson(Map<String, dynamic> map){
    return NewHomeMdl(
      id : map['id'],
      timestamp : map['timestamp'],
      config : ConfigBean.fromMap(map['config']),
      collections : CollectionsListBean.fromMapList(map['collections']),
    );
  }
  Map<String, dynamic> responseToJson() => {
    "id": id,
    "timestamp": timestamp,
    "config":config,
    "carousel" :carousel,
    "collections": collections,
  };



//  static NewHomeMdl fromMap(Map<String, dynamic> map) {
//    NewHomeMdl newHomeMdl = new NewHomeMdl();
//    newHomeMdl.id = map['id'];
//    newHomeMdl.timestamp = map['timestamp'];
//    newHomeMdl.config = ConfigBean.fromMap(map['config']);
//    newHomeMdl.carousel = CarouselListBean.fromMapList(map['carousel']);
//    newHomeMdl.collections = CollectionsListBean.fromMapList(map['collections']);
//    return newHomeMdl;
//  }
//
//  static List<NewHomeMdl> fromMapList(dynamic mapList) {
//    List<NewHomeMdl> list = new List(mapList.length);
//    for (int i = 0; i < mapList.length; i++) {
//      list[i] = fromMap(mapList[i]);
//    }
//    return list;
//  }

}
NewHomeMdl newHomeFromJson(String body) {
  final jsonData = json.decode(body);
  return NewHomeMdl.fromJson(jsonData);
}

class ConfigBean {
  ImageUrlsBean imageUrls;

  static ConfigBean fromMap(Map<String, dynamic> map) {
    ConfigBean configBean = new ConfigBean();
    configBean.imageUrls = ImageUrlsBean.fromMap(map['imageUrls']);
    return configBean;
  }

  static List<ConfigBean> fromMapList(dynamic mapList) {
    List<ConfigBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class CarouselListBean {
  String imagePackId;
  String tierDisplay;
  String contentType;
  String contentKey;
  String parentalGuidance;
  String slug;
  TitleBean title;
  List<String> tiers;
  List<String> trailers;

  static CarouselListBean fromMap(Map<String, dynamic> map) {
    CarouselListBean carouselListBean = new CarouselListBean();
    carouselListBean.imagePackId = map['imagePackId'];
    carouselListBean.tierDisplay = map['tierDisplay'];
    carouselListBean.contentType = map['contentType'];
    carouselListBean.contentKey = map['contentKey'];
    carouselListBean.parentalGuidance = map['parentalGuidance'];
    carouselListBean.slug = map['slug'];
    carouselListBean.title = TitleBean.fromMap(map['title']);

    List<dynamic> dynamicList0 = map['tiers'];
    carouselListBean.tiers = new List();
    carouselListBean.tiers.addAll(dynamicList0.map((o) => o.toString()));

    List<dynamic> dynamicList1 = map['trailers'];
    carouselListBean.trailers = new List();
    carouselListBean.trailers.addAll(dynamicList1.map((o) => o.toString()));

    return carouselListBean;
  }

  static List<CarouselListBean> fromMapList(dynamic mapList) {
    List<CarouselListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class CollectionsListBean {
  HeaderBean header;
  String title;
  List<ItemsListBean> items ;
  List<ContentMdl> contents;

  CollectionsListBean(this.header, this.title, this.items,this.contents); //

//  CollectionsListBean({ this.header});
////
//  factory CollectionsListBean.fromJson(Map<String, dynamic> map){
//    return CollectionsListBean(
//      header: map['header'],
////      items : map['items']
//    );
//  }

  static CollectionsListBean fromMap(Map<String, dynamic> map) {
//    CollectionsListBean collectionsListBean = new CollectionsListBean();
//    collectionsListBean.header =map['header']!=null? HeaderBean.fromMap(map['header']): new HeaderBean();
//    collectionsListBean.title = map['title']!=null?map['title']:"kosong";
//    collectionsListBean.items = map['items']!=null?ItemsListBean.fromMapList(map['items']): new List<ItemsListBean>(0);
    return CollectionsListBean(
      map['header']!=null? HeaderBean.fromMap(map['header']): new HeaderBean(),
        map['title']!=null?map['title']:"kosong",
       map['items']!=null?ItemsListBean.fromMapList(map['items']): new List<ItemsListBean>(0),
      []
    );
  }

  static List<CollectionsListBean> fromMapList(dynamic mapList) {

    print("mapList"+mapList.toString());
    List<CollectionsListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

//List<CollectionsListBean> newAllFromJson(String str) {
//
//  print("json header"+str);
//  final jsonData = json.decode(str);
//  return [];
//}

class HeaderBean {
  String layout;

  static HeaderBean fromMap(Map<String, dynamic> map) {
    HeaderBean headerBean = new HeaderBean();
    headerBean.layout = map['layout'];
    return headerBean;
  }

  static List<HeaderBean> fromMapList(dynamic mapList) {
    List<HeaderBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class ItemsListBean {
  String imagePackId;
  String tierDisplay;
  String contentType;
  String contentKey;
  String parentalGuidance;
  String slug;
  TitleBean description;
  TitleBean title;
//  List<String> tiers;
//  List<String> trailers;

  static ItemsListBean fromMap(Map<String, dynamic> map) {
    ItemsListBean itemsListBean = new ItemsListBean();
    itemsListBean.imagePackId = map['imagePackId'];
    itemsListBean.tierDisplay = map['tierDisplay'];
    itemsListBean.contentType = map['contentType'];
    itemsListBean.contentKey = map['contentKey'];
    itemsListBean.parentalGuidance = map['parentalGuidance'];
    itemsListBean.slug = map['slug'];
    itemsListBean.description =map['description']!=null?TitleBean.fromMap(map['description']): new TitleBean();
    itemsListBean.title = TitleBean.fromMap(map['title']);

    List<dynamic> dynamicList0 = map['tiers'];
//    itemsListBean.tiers = new List();
//    itemsListBean.tiers.addAll(dynamicList0.map((o) => o.toString()));

    List<dynamic> dynamicList1 = map['trailers'];
//    itemsListBean.trailers = new List();
//    itemsListBean.trailers.addAll(dynamicList1.map((o) => o.toString()));

    return itemsListBean;
  }

  static List<ItemsListBean> fromMapList(dynamic mapList) {
    List<ItemsListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class TitleBean {
  String en;
  String enUs;

  static TitleBean fromMap(Map<String, dynamic> map) {
    TitleBean titleBean = new TitleBean();
    titleBean.en = map['*']!=null?map['*']:map['en_US'];
    titleBean.enUs = map['en_US'];
    return titleBean;
  }

  static List<TitleBean> fromMapList(dynamic mapList) {
    List<TitleBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class ImageUrlsBean {
  String carouselLandscapeWideXLarge;
  String carouselLandscapeWideXLargeRtl;
  String logoLandscapeWideXLarge;
  String carouselLandscapeWideLarge;
  String carouselLandscapeWideLargeRtl;
  String logoLandscapeWideLarge;
  String carouselLandscapeWideSmall;
  String carouselLandscapeWideSmallRtl;
  String logoLandscapeWideSmall;
  String carouselLandscapeXLarge;
  String carouselLandscapeXLargeRtl;
  String logoLandscapeXLarge;
  String carouselLandscapeLarge;
  String carouselLandscapeLargeRtl;
  String logoLandscapeLarge;
  String carouselLandscapeSmall;
  String carouselLandscapeSmallRtl;
  String logoLandscapeSmall;
  String carouselSquareXLarge;
  String carouselSquareXLargeRtl;
  String logoSquareXLarge;
  String carouselSquareLarge;
  String carouselSquareLargeRtl;
  String logoSquareLarge;
  String carouselSquareSmall;
  String carouselSquareSmallRtl;
  String logoSquareSmall;
  String carouselPortraitXLarge;
  String carouselPortraitXLargeRtl;
  String logoPortraitXLarge;
  String carouselPortraitLarge;
  String carouselPortraitLargeRtl;
  String logoPortraitLarge;
  String carouselPortraitSmall;
  String carouselPortraitSmallRtl;
  String logoPortraitSmall;
  String tiny;
  String small;
  String medium;
  String carousel;
  String rectangular;

  static ImageUrlsBean fromMap(Map<String, dynamic> map) {
    ImageUrlsBean imageUrlsBean = new ImageUrlsBean();
    imageUrlsBean.carouselLandscapeWideXLarge = map['carouselLandscapeWideXLarge'];
    imageUrlsBean.carouselLandscapeWideXLargeRtl = map['carouselLandscapeWideXLargeRtl'];
    imageUrlsBean.logoLandscapeWideXLarge = map['logoLandscapeWideXLarge'];
    imageUrlsBean.carouselLandscapeWideLarge = map['carouselLandscapeWideLarge'];
    imageUrlsBean.carouselLandscapeWideLargeRtl = map['carouselLandscapeWideLargeRtl'];
    imageUrlsBean.logoLandscapeWideLarge = map['logoLandscapeWideLarge'];
    imageUrlsBean.carouselLandscapeWideSmall = map['carouselLandscapeWideSmall'];
    imageUrlsBean.carouselLandscapeWideSmallRtl = map['carouselLandscapeWideSmallRtl'];
    imageUrlsBean.logoLandscapeWideSmall = map['logoLandscapeWideSmall'];
    imageUrlsBean.carouselLandscapeXLarge = map['carouselLandscapeXLarge'];
    imageUrlsBean.carouselLandscapeXLargeRtl = map['carouselLandscapeXLargeRtl'];
    imageUrlsBean.logoLandscapeXLarge = map['logoLandscapeXLarge'];
    imageUrlsBean.carouselLandscapeLarge = map['carouselLandscapeLarge'];
    imageUrlsBean.carouselLandscapeLargeRtl = map['carouselLandscapeLargeRtl'];
    imageUrlsBean.logoLandscapeLarge = map['logoLandscapeLarge'];
    imageUrlsBean.carouselLandscapeSmall = map['carouselLandscapeSmall'];
    imageUrlsBean.carouselLandscapeSmallRtl = map['carouselLandscapeSmallRtl'];
    imageUrlsBean.logoLandscapeSmall = map['logoLandscapeSmall'];
    imageUrlsBean.carouselSquareXLarge = map['carouselSquareXLarge'];
    imageUrlsBean.carouselSquareXLargeRtl = map['carouselSquareXLargeRtl'];
    imageUrlsBean.logoSquareXLarge = map['logoSquareXLarge'];
    imageUrlsBean.carouselSquareLarge = map['carouselSquareLarge'];
    imageUrlsBean.carouselSquareLargeRtl = map['carouselSquareLargeRtl'];
    imageUrlsBean.logoSquareLarge = map['logoSquareLarge'];
    imageUrlsBean.carouselSquareSmall = map['carouselSquareSmall'];
    imageUrlsBean.carouselSquareSmallRtl = map['carouselSquareSmallRtl'];
    imageUrlsBean.logoSquareSmall = map['logoSquareSmall'];
    imageUrlsBean.carouselPortraitXLarge = map['carouselPortraitXLarge'];
    imageUrlsBean.carouselPortraitXLargeRtl = map['carouselPortraitXLargeRtl'];
    imageUrlsBean.logoPortraitXLarge = map['logoPortraitXLarge'];
    imageUrlsBean.carouselPortraitLarge = map['carouselPortraitLarge'];
    imageUrlsBean.carouselPortraitLargeRtl = map['carouselPortraitLargeRtl'];
    imageUrlsBean.logoPortraitLarge = map['logoPortraitLarge'];
    imageUrlsBean.carouselPortraitSmall = map['carouselPortraitSmall'];
    imageUrlsBean.carouselPortraitSmallRtl = map['carouselPortraitSmallRtl'];
    imageUrlsBean.logoPortraitSmall = map['logoPortraitSmall'];
    imageUrlsBean.tiny = map['tiny'];
    imageUrlsBean.small = map['small'];
    imageUrlsBean.medium = map['medium'];
    imageUrlsBean.carousel = map['carousel'];
    imageUrlsBean.rectangular = map['rectangular'];
    return imageUrlsBean;
  }

  static List<ImageUrlsBean> fromMapList(dynamic mapList) {
    List<ImageUrlsBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
