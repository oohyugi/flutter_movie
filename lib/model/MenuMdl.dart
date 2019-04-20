import 'dart:convert';

class MenuMdl {
  String id;
  String vimondID;
  String title;
  String path;
  int sortIndex;
  I18nTitleBean i18nTitle;
  List<CategoryMdl> categories ;


  MenuMdl({this.id, this.vimondID, this.title, this.path, this.sortIndex,
      this.i18nTitle, this.categories});

  factory MenuMdl.fromJson(Map<String, dynamic> map) {
    return new MenuMdl(
        id: map['id'],
        vimondID: map['vimondID'],
        title: map['title'],
        path: map['path'],
        sortIndex: map['sortIndex'],
        i18nTitle: I18nTitleBean.fromMap(map['i18nTitle']),
        categories: CategoryMdl.fromMapList(map['categories'])

    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "vimondID": vimondID,
    "title": title,
    "path" :path,
    "sortIndex": sortIndex,
    "i18nTitle": i18nTitle,
    "categories": categories
  };

}
MenuMdl MenuFromJson(String str) {
  final jsonData = json.decode(str);
  return MenuMdl.fromJson(jsonData);
}

String MenuToJson(MenuMdl data) {
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




class CategoryMdl{
  String id;
  String vimondID;
  String title;
  String path;
  int sortIndex;
  I18nTitleBean i18nTitle;

  static CategoryMdl fromMap(Map<String, dynamic> map) {
    CategoryMdl menuMdl = new CategoryMdl();
    menuMdl.id = map['id'];
    menuMdl.vimondID = map['vimondID'];
    menuMdl.title = map['title'];
    menuMdl.path = map['path'];
    menuMdl.sortIndex = map['sortIndex'];
    menuMdl.i18nTitle = I18nTitleBean.fromMap(map['i18nTitle']);
    return menuMdl;
  }

  static List<CategoryMdl> fromMapList(dynamic mapList) {
    List<CategoryMdl> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class I18nTitleBean {
  String in_ID;
  String en_US;

  static I18nTitleBean fromMap(Map<String, dynamic> map) {
    I18nTitleBean i18nTitleBean = new I18nTitleBean();
    i18nTitleBean.in_ID = map['in_ID'];
    i18nTitleBean.en_US = map['en_US'];
    return i18nTitleBean;
  }

  static List<I18nTitleBean> fromMapList(dynamic mapList) {
    List<I18nTitleBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
