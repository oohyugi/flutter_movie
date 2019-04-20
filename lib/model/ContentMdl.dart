import 'dart:convert';

class ContentMdl {
  String level;
  String channel;
  String sourceLanguage;
  String imageUrl;
  String imagePackId;
  String slug;
  int id;
  int vimondID;
  int parentId;
  DescriptionBean description;
  SynopsisBean synopsis;
  TitleBean title;
  List<String> tiers;
  List<String> trailers;



  static ContentMdl fromMap(Map<String, dynamic> map) {
    ContentMdl contentMdl = new ContentMdl();
    contentMdl.level = map['level'];
    contentMdl.channel = map['channel'];
    contentMdl.sourceLanguage = map['sourceLanguage'];
    contentMdl.imageUrl = map['imageUrl'];
    contentMdl.imagePackId = map['imagePackId'];
    contentMdl.slug = map['slug'];
    contentMdl.id = map['id'];
    contentMdl.vimondID = map['vimondID'];
    contentMdl.parentId = map['parentId'];
    contentMdl.description = DescriptionBean.fromMap(map['description']);
    contentMdl.synopsis = SynopsisBean.fromMap(map['synopsis']);
    contentMdl.title = map['title']!=null?TitleBean.fromMap(map['title']):TitleBean("kosong", "kosong", "kosong", "kosong");

    List<dynamic> dynamicList0 = map['tiers'];
    contentMdl.tiers = new List();
    contentMdl.tiers.addAll(dynamicList0.map((o) => o.toString()));

    List<dynamic> dynamicList1 = map['trailers'];
    contentMdl.trailers = new List();
    contentMdl.trailers.addAll(dynamicList1.map((o) => o.toString()));

    return contentMdl;
  }

  static List<ContentMdl> fromMapList(dynamic mapList) {
    List<ContentMdl> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

List<ContentMdl> contentMdlFromJson(String body) {
  final jsonData = json.decode(body);
  return ContentMdl.fromMapList(jsonData);
}


class DescriptionBean {
  String en_US;
  String th_TH;
  String my_MM;
  String vi_VN;

  static DescriptionBean fromMap(Map<String, dynamic> map) {
    DescriptionBean descriptionBean = new DescriptionBean();
    descriptionBean.en_US = map['en_US']!=null ? map['en_US'] : "null";
    descriptionBean.th_TH = map['th_TH'];
    descriptionBean.my_MM = map['my_MM'];
    descriptionBean.vi_VN = map['vi_VN'];
    return descriptionBean;
  }

  static List<DescriptionBean> fromMapList(dynamic mapList) {
    List<DescriptionBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class SynopsisBean {
  String th_TH;
  String en_US;
  String my_MM;
  String vi_VN;

  static SynopsisBean fromMap(Map<String, dynamic> map) {
    SynopsisBean synopsisBean = new SynopsisBean();
    synopsisBean.th_TH = map['th_TH'];
    synopsisBean.en_US = map['en_US']!=null ? map['en_US'] : "null";
    synopsisBean.my_MM = map['my_MM'];
    synopsisBean.vi_VN = map['vi_VN'];
    return synopsisBean;
  }

  static List<SynopsisBean> fromMapList(dynamic mapList) {
    List<SynopsisBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class TitleBean {
  String my_MM;
  String th_TH;
  String en_US;
  String vi_VN;


  TitleBean(this.my_MM, this.th_TH, this.en_US, this.vi_VN);

  static TitleBean fromMap(Map<String, dynamic> map) {

    return TitleBean(
      map['my_MM'],
      map['th_TH'],
      map['en_US']!= null ? map['en_US'] : "null",
      map['vi_VN']
    );
  }

  static List<TitleBean> fromMapList(dynamic mapList) {
    List<TitleBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
