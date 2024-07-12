import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wall_art/core/models/home_wallpapers_model.dart';

class NetworkServiceHome {
  final Dio dio = Dio();

  Future<List<HomeWallpapersModel>> getService() async {
    try {
      String url = 'http://192.168.130.94:3000/api/home';

      Response response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("response ${response.statusCode}");
        List<dynamic> data = response.data;

        List<HomeWallpapersModel> homeWallpapers =
            data.map((e) => HomeWallpapersModel.fromJson(e)).toList();
        return homeWallpapers;
      } else {
        throw Exception("Errorr occured");
      }
    } catch (e) {
      throw Exception("errorr $e");
    }
  }
}
