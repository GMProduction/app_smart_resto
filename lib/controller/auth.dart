import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/static_variable.dart';

Future<void> registerHandler(
    Map<String, String> data, BuildContext context) async {
  try {
    var formData = FormData.fromMap(data);
    final response = await Dio().post("$HostAddress/register",
        options: Options(headers: {"Accept": "application/json"}),
        data: formData);
    log(response.data.toString());
    final String token = response.data["accessToken"] as String;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
    Navigator.pushNamedAndRemoveUntil(
        context, "home", ModalRoute.withName("home"));
  } on DioError catch (e) {
    log(e.response!.data.toString());
  }
}

Future<void> loginHandler(
    Map<String, String> data, BuildContext context) async {
  try {
    var formData = FormData.fromMap(data);
    final response = await Dio().post("$HostAddress/login",
        options: Options(headers: {"Accept": "application/json"}),
        data: formData);
    log(response.data.toString());
    final String token = response.data["accessToken"] as String;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
    Navigator.pushNamedAndRemoveUntil(
        context, "home", ModalRoute.withName("home"));
  } on DioError catch (e) {
    log(e.response!.data.toString());
  }
}
