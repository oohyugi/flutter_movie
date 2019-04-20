import 'dart:convert';

class CollectionItems {
  String contentKey;
  String contentType;
  String imagePackId;
  String parentalGuidance;
  List<String> tiers;
  Title title;
  String type;
  Description description;
  String slug;


  CollectionItems({this.contentKey, this.contentType, this.imagePackId,
    this.parentalGuidance, this.tiers, this.title, this.type,
    this.description, this.slug});

  factory CollectionItems.fromJson(Map<String, dynamic> json) {
    return new CollectionItems(
        contentKey: json['contentKey'],
        contentType: json['contentType'],
        imagePackId: json['imagePackId'],
        parentalGuidance: json['parentalGuidance'],
        tiers: json['tiers'].cast<String>(),
        title: json['title'] != null ? new Title.fromJson(json['title']) : null,
        type: json['type'],
        description: json['description'] != null ? new Description.fromJson(
            json['description']) : null,
        slug : json['slug']
    );
  }

  static List<CollectionItems> allFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<CollectionItems>.from(jsonData.map((x) => CollectionItems.fromJson(x)));
  }

  static String allToJson(List<CollectionItems> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentKey'] = this.contentKey;
    data['contentType'] = this.contentType;
    data['imagePackId'] = this.imagePackId;
    data['parentalGuidance'] = this.parentalGuidance;
    data['tiers'] = this.tiers;
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    data['type'] = this.type;
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    data['slug'] = this.slug;
    return data;
  }


}



class Title {
  String _en;
  String _in;
  String _th;
  String _vi;

  Title({String en, String ins, String th, String vi}) {
    this._en = en;
    this._in = ins;
    this._th = th;
    this._vi = vi;
  }


  Title.fromJson(Map<String, dynamic> json) {
    _en = json['en'];
    _in = json['in'];
    _th = json['th'];
    _vi = json['vi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this._en;
    data['in'] = this._in;
    data['th'] = this._th;
    data['vi'] = this._vi;
    return data;
  }
}

class Description {
  String _en;
  String _in;
  String _th;
  String _vi;

  Description({String en, String ins, String th, String vi}) {
    this._en = en;
    this._in = ins;
    this._th = th;
    this._vi = vi;
  }

  Description.fromJson(Map<String, dynamic> json) {
    _en = json['en'];
    _in = json['in'];
    _th = json['th'];
    _vi = json['vi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this._en;
    data['in'] = this._in;
    data['th'] = this._th;
    data['vi'] = this._vi;
    return data;
  }
}