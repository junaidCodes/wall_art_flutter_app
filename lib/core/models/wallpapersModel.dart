class HomeRandomWallpapersModel {
  String? message;
  List<Getwall>? getwall;

  HomeRandomWallpapersModel({
    this.message,
    this.getwall,
  });

  factory HomeRandomWallpapersModel.fromJson(Map<String, dynamic> json) => HomeRandomWallpapersModel(
    message: json["message"] as String?,
    getwall: (json["getwall"] as List<dynamic>?)
        ?.map((x) => Getwall.fromJson(x as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "getwall": getwall?.map((x) => x.toJson()).toList(),
  };
}

class Getwall {
  int? id;
  int? categoryId;
  String? wallpaperImageUrl;
  String? wallpaperTitle;

  Getwall({
    this.id,
    this.categoryId,
    this.wallpaperImageUrl,
    this.wallpaperTitle,
  });

  factory Getwall.fromJson(Map<String, dynamic> json) => Getwall(
    id: json["id"] as int?,
    categoryId: json["categoryId"] as int?,
    wallpaperImageUrl: json["wallpaper_image_url"] as String?,
    wallpaperTitle: json["wallpaper_title"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryId": categoryId,
    "wallpaper_image_url": wallpaperImageUrl,
    "wallpaper_title": wallpaperTitle,
  };
}
