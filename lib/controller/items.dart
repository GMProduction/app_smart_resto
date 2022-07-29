import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/static_variable.dart';

Future<List<dynamic>> getItemByCategory(String id) async {
  List<dynamic> _results = [];
  String url = '$HostAddress/item/$id/category';
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    final response = await Dio().get(
      url,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      ),
    );
    log(response.data.toString());
    _results = response.data["payload"] as List;
  } on DioError catch (e) {
    log(e.response!.data.toString());
  }
  return _results;
}

Future<Map<String, dynamic>> getMenuById(String id) async {
  Map<String, dynamic> _data = {};
  String url = '$HostAddress/item/$id';
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    final response = await Dio().get(
      url,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      ),
    );
    _data = response.data["payload"] as Map<String, dynamic>;
    print("Oke");
  } on DioError catch (e) {
    print(e.message);
  }
  return _data;
}
