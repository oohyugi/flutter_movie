class ConfigMdl {
  ImageUrls imageUrls;

  ConfigMdl({this.imageUrls});

  ConfigMdl.fromJson(Map<String, dynamic> json) {
    imageUrls = json['imageUrls'] != null
        ? new ImageUrls.fromJson(json['imageUrls'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imageUrls != null) {
      data['imageUrls'] = this.imageUrls.toJson();
    }
    return data;
  }
}

class ImageUrls {
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

  ImageUrls(
      {this.carouselLandscapeWideXLarge,
        this.carouselLandscapeWideXLargeRtl,
        this.logoLandscapeWideXLarge,
        this.carouselLandscapeWideLarge,
        this.carouselLandscapeWideLargeRtl,
        this.logoLandscapeWideLarge,
        this.carouselLandscapeWideSmall,
        this.carouselLandscapeWideSmallRtl,
        this.logoLandscapeWideSmall,
        this.carouselLandscapeXLarge,
        this.carouselLandscapeXLargeRtl,
        this.logoLandscapeXLarge,
        this.carouselLandscapeLarge,
        this.carouselLandscapeLargeRtl,
        this.logoLandscapeLarge,
        this.carouselLandscapeSmall,
        this.carouselLandscapeSmallRtl,
        this.logoLandscapeSmall,
        this.carouselSquareXLarge,
        this.carouselSquareXLargeRtl,
        this.logoSquareXLarge,
        this.carouselSquareLarge,
        this.carouselSquareLargeRtl,
        this.logoSquareLarge,
        this.carouselSquareSmall,
        this.carouselSquareSmallRtl,
        this.logoSquareSmall,
        this.carouselPortraitXLarge,
        this.carouselPortraitXLargeRtl,
        this.logoPortraitXLarge,
        this.carouselPortraitLarge,
        this.carouselPortraitLargeRtl,
        this.logoPortraitLarge,
        this.carouselPortraitSmall,
        this.carouselPortraitSmallRtl,
        this.logoPortraitSmall,
        this.tiny,
        this.small,
        this.medium,
        this.carousel,
        this.rectangular});

  ImageUrls.fromJson(Map<String, dynamic> json) {
    carouselLandscapeWideXLarge = json['carouselLandscapeWideXLarge'];
    carouselLandscapeWideXLargeRtl = json['carouselLandscapeWideXLargeRtl'];
    logoLandscapeWideXLarge = json['logoLandscapeWideXLarge'];
    carouselLandscapeWideLarge = json['carouselLandscapeWideLarge'];
    carouselLandscapeWideLargeRtl = json['carouselLandscapeWideLargeRtl'];
    logoLandscapeWideLarge = json['logoLandscapeWideLarge'];
    carouselLandscapeWideSmall = json['carouselLandscapeWideSmall'];
    carouselLandscapeWideSmallRtl = json['carouselLandscapeWideSmallRtl'];
    logoLandscapeWideSmall = json['logoLandscapeWideSmall'];
    carouselLandscapeXLarge = json['carouselLandscapeXLarge'];
    carouselLandscapeXLargeRtl = json['carouselLandscapeXLargeRtl'];
    logoLandscapeXLarge = json['logoLandscapeXLarge'];
    carouselLandscapeLarge = json['carouselLandscapeLarge'];
    carouselLandscapeLargeRtl = json['carouselLandscapeLargeRtl'];
    logoLandscapeLarge = json['logoLandscapeLarge'];
    carouselLandscapeSmall = json['carouselLandscapeSmall'];
    carouselLandscapeSmallRtl = json['carouselLandscapeSmallRtl'];
    logoLandscapeSmall = json['logoLandscapeSmall'];
    carouselSquareXLarge = json['carouselSquareXLarge'];
    carouselSquareXLargeRtl = json['carouselSquareXLargeRtl'];
    logoSquareXLarge = json['logoSquareXLarge'];
    carouselSquareLarge = json['carouselSquareLarge'];
    carouselSquareLargeRtl = json['carouselSquareLargeRtl'];
    logoSquareLarge = json['logoSquareLarge'];
    carouselSquareSmall = json['carouselSquareSmall'];
    carouselSquareSmallRtl = json['carouselSquareSmallRtl'];
    logoSquareSmall = json['logoSquareSmall'];
    carouselPortraitXLarge = json['carouselPortraitXLarge'];
    carouselPortraitXLargeRtl = json['carouselPortraitXLargeRtl'];
    logoPortraitXLarge = json['logoPortraitXLarge'];
    carouselPortraitLarge = json['carouselPortraitLarge'];
    carouselPortraitLargeRtl = json['carouselPortraitLargeRtl'];
    logoPortraitLarge = json['logoPortraitLarge'];
    carouselPortraitSmall = json['carouselPortraitSmall'];
    carouselPortraitSmallRtl = json['carouselPortraitSmallRtl'];
    logoPortraitSmall = json['logoPortraitSmall'];
    tiny = json['tiny'];
    small = json['small'];
    medium = json['medium'];
    carousel = json['carousel'];
    rectangular = json['rectangular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carouselLandscapeWideXLarge'] = this.carouselLandscapeWideXLarge;
    data['carouselLandscapeWideXLargeRtl'] =
        this.carouselLandscapeWideXLargeRtl;
    data['logoLandscapeWideXLarge'] = this.logoLandscapeWideXLarge;
    data['carouselLandscapeWideLarge'] = this.carouselLandscapeWideLarge;
    data['carouselLandscapeWideLargeRtl'] = this.carouselLandscapeWideLargeRtl;
    data['logoLandscapeWideLarge'] = this.logoLandscapeWideLarge;
    data['carouselLandscapeWideSmall'] = this.carouselLandscapeWideSmall;
    data['carouselLandscapeWideSmallRtl'] = this.carouselLandscapeWideSmallRtl;
    data['logoLandscapeWideSmall'] = this.logoLandscapeWideSmall;
    data['carouselLandscapeXLarge'] = this.carouselLandscapeXLarge;
    data['carouselLandscapeXLargeRtl'] = this.carouselLandscapeXLargeRtl;
    data['logoLandscapeXLarge'] = this.logoLandscapeXLarge;
    data['carouselLandscapeLarge'] = this.carouselLandscapeLarge;
    data['carouselLandscapeLargeRtl'] = this.carouselLandscapeLargeRtl;
    data['logoLandscapeLarge'] = this.logoLandscapeLarge;
    data['carouselLandscapeSmall'] = this.carouselLandscapeSmall;
    data['carouselLandscapeSmallRtl'] = this.carouselLandscapeSmallRtl;
    data['logoLandscapeSmall'] = this.logoLandscapeSmall;
    data['carouselSquareXLarge'] = this.carouselSquareXLarge;
    data['carouselSquareXLargeRtl'] = this.carouselSquareXLargeRtl;
    data['logoSquareXLarge'] = this.logoSquareXLarge;
    data['carouselSquareLarge'] = this.carouselSquareLarge;
    data['carouselSquareLargeRtl'] = this.carouselSquareLargeRtl;
    data['logoSquareLarge'] = this.logoSquareLarge;
    data['carouselSquareSmall'] = this.carouselSquareSmall;
    data['carouselSquareSmallRtl'] = this.carouselSquareSmallRtl;
    data['logoSquareSmall'] = this.logoSquareSmall;
    data['carouselPortraitXLarge'] = this.carouselPortraitXLarge;
    data['carouselPortraitXLargeRtl'] = this.carouselPortraitXLargeRtl;
    data['logoPortraitXLarge'] = this.logoPortraitXLarge;
    data['carouselPortraitLarge'] = this.carouselPortraitLarge;
    data['carouselPortraitLargeRtl'] = this.carouselPortraitLargeRtl;
    data['logoPortraitLarge'] = this.logoPortraitLarge;
    data['carouselPortraitSmall'] = this.carouselPortraitSmall;
    data['carouselPortraitSmallRtl'] = this.carouselPortraitSmallRtl;
    data['logoPortraitSmall'] = this.logoPortraitSmall;
    data['tiny'] = this.tiny;
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['carousel'] = this.carousel;
    data['rectangular'] = this.rectangular;
    return data;
  }
}