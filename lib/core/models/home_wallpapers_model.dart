class HomeWallpapersModel {
  final int id;
  final String categoryName;
  final String categoryImage;
  final List<CategoryWallpaper> categoryWallpapers;

  HomeWallpapersModel({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryWallpapers,
  });

  factory HomeWallpapersModel.fromJson(Map<String, dynamic> json) {
    return HomeWallpapersModel(
      id: json["id"] ?? 0,
      categoryName: json["category_name"] ?? '',
      categoryImage: json["category_image"] ?? '',
      categoryWallpapers: (json["category_wallpapers"] as List<dynamic>?)
              ?.map((x) => CategoryWallpaper.fromJson(x))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "category_name": categoryName,
      "category_image": categoryImage,
      "category_wallpapers": categoryWallpapers.map((x) => x.toJson()).toList(),
    };
  }
}

class CategoryWallpaper {
  final int id;
  final String wallpaperTitle;
  final String wallpaperImageUrl;

  CategoryWallpaper({
    required this.id,
    required this.wallpaperTitle,
    required this.wallpaperImageUrl,
  });

  factory CategoryWallpaper.fromJson(Map<String, dynamic> json) {
    return CategoryWallpaper(
      id: json["id"] ?? 0,
      wallpaperTitle: json["wallpaper_title"] ?? '',
      wallpaperImageUrl: json["wallpaper_image_url"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "wallpaper_title": wallpaperTitle,
      "wallpaper_image_url": wallpaperImageUrl,
    };
  }
}
