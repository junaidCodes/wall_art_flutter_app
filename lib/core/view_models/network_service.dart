// // Adjust this import based on your project structure

// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:wall_art/core/models/wallpapersModel.dart';
// // Adjust this import based on your project structure

// class NetworkService {
//   final Dio _dio = Dio();

//   Future<List<WallpapersModel>> fetchWallpapers() async {
//     try {
//       Response response = await _dio.get(
//         'http://192.168.200.104:3000/api/categorywallpaper',
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         log(response.statusCode.toString());

//         List<dynamic> data = response.data;
//         List<WallpapersModel> wallpapers =
//             data.map((e) => WallpapersModel.fromJson(e)).toList();
//         return wallpapers;
//       } else {
//         throw Exception("Failed to load wallpapersfff");
//       }
//     } catch (e) {
//       throw Exception("NetworkService Errror: $e");

//     }
//   }
// }
