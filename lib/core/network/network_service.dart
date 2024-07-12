// // Adjust this import based on your project structure

// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:wall_art/core/models/home_wallpapers_model.dart';
// import 'package:wall_art/core/models/wallpapersModel.dart';
// // Adjust this import based on your project structure

// class NetworkService {
//   static Dio _dio = Dio();

//   static Future<List<HomeWallpapersModel>> fetchWallpapers() async {
//     try {
//       String url = 'http://192.168.200.104:3000/api/home';
//       log("here");
//       Response response = await _dio.get(
//         'http://192.168.200.104:3000/api/categorywallpaper',
//       );
//       log("gere");
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         log(response.statusCode.toString());

//         List<dynamic> data = response.data;
//         List<HomeWallpapersModel> wallpapers =
//             data.map((e) => HomeWallpapersModel.fromJson(e)).toList();
//         return wallpapers;
//       } else {
//         throw Exception("Failed to load wallpapersfff");
//       }
//     } catch (e) {
//       throw Exception("NetworkService Errror: $e");
//     }
//   }
// }
