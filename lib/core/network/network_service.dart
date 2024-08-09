import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:wall_art/core/models/wallpapersModel.dart';
 // Ensure this imports your Item model class

class RandomWallpaperApiService {

  final Dio _dio = Dio();
  final String url = 'http://192.168.42.249:3000/api/wallpapers'; // Replace with your API base URL

  Future<HomeRandomWallpapersModel> fetchItem() async {
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("status code iss ${response.statusCode}");

        return HomeRandomWallpapersModel.fromJson(response.data);

      } else {
        throw Exception('Failed to load item');
      }
    } catch (error) {
      throw Exception('Failed to load item: $error');
    }
  }
}
