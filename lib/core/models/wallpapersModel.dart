class WallpapersModel {
  int id;
  String categoryName;
  String categoryImage;
  List<CategoryWallpaper> categoryWallpapers;

  WallpapersModel({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryWallpapers,
  });

  factory WallpapersModel.fromJson(Map<String, dynamic> json) =>
      WallpapersModel(
        id: json["id"] ?? 0,
        categoryName: json["category_name"] ?? "",
        categoryImage: json["category_image"] ?? "",
        categoryWallpapers: json["category_wallpapers"] != null
            ? List<CategoryWallpaper>.from(json["category_wallpapers"]
                .map((x) => CategoryWallpaper.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_wallpapers":
            List<dynamic>.from(categoryWallpapers.map((x) => x.toJson())),
      };
}

class CategoryWallpaper {
  int id;
  String wallpaperTitle;
  String? wallpaperImageUrl;

  CategoryWallpaper({
    required this.id,
    required this.wallpaperTitle,
    this.wallpaperImageUrl,
  });

  factory CategoryWallpaper.fromJson(Map<String, dynamic> json) =>
      CategoryWallpaper(
        id: json["id"] ?? 0,
        wallpaperTitle: json["wallpaper_title"] ?? "",
        wallpaperImageUrl: json["wallpaper_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wallpaper_title": wallpaperTitle,
        "wallpaper_image_url": wallpaperImageUrl,
      };
}
