import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/static_variable.dart';

Future<List<dynamic>> listAvailableCart() async {
  List<dynamic> _results = [];
  String url = '$HostAddress/cart';
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
    _results = response.data["payload"] as List;
    log(_results.toString());
  } on DioError catch (e) {
    log(e.response!.data.toString());
  }
  return _results;
}

Future<void> addToCart(Map<String, dynamic> data, BuildContext context) async {
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    var formData = FormData.fromMap(data);
    final response = await Dio().post("$HostAddress/cart",
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }),
        data: formData);
    log(response.data.toString());
    Fluttertoast.showToast(
      msg: "Berhasil menambah menu",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.pop(context);
  } on DioError catch (e) {
    log(e.response!.data.toString());
    Fluttertoast.showToast(
      msg: "Gagal Menambah Menu",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

Future<void> checkout(BuildContext context) async {
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    final response = await Dio().post(
      "$HostAddress/cart/checkout",
      options: Options(headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );
    log(response.data.toString());
    Fluttertoast.showToast(
      msg: "Berhasil menambah menu",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.pop(context);
  } on DioError catch (e) {
    log(e.response!.data.toString());
    Fluttertoast.showToast(
      msg: "Gagal Menambah Menu",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
