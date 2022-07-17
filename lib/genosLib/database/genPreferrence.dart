import 'package:shared_preferences/shared_preferences.dart';

//TOKEN
Future setPrefferenceToken(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', value);
}

Future getPrefferenceToken() async {
  String? token;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  return token;
}

//AVATAR
Future setPrefferenceAvatar(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('avatar', value);
}

Future getPrefferenceAvatar() async {
  String? avatar;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  avatar = prefs.getString('avatar');
  return avatar;
}

//Nama
Future setPrefferenceNama(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('nama', value);
}

Future getPrefferenceNama() async {
  String? avatar;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  avatar = prefs.getString('nama');
  return avatar;
}

logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
