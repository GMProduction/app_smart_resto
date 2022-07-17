import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var opacity = 0.0;
  String buildNumber = "";

  @override
  void initState() {
    super.initState();

  }


  @override
  dispose() {
    super.dispose();
  }


  cekLogin() async {

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    // buildNumber = packageInfo.version;
    buildNumber = packageInfo.buildNumber;

    // var log = await getPrefferenceToken();

    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration,  (){ log == null
        ? Navigator.pushReplacementNamed(context, "welcome")
        : Navigator.pushReplacementNamed(context, "welcome");});


  }

  startSplashScreen()  {
    cekLogin();

    // var token = await getPrefferenceToken();
    // // var token = "asw";
    // if (token) {
    //   var duration = const Duration(milliseconds: 2000);
    //   return Timer(duration, () {
    //     Navigator.pushReplacementNamed(context, "loginPage");
    //   });
    // } else {
    //   var duration = const Duration(milliseconds: 2000);
    //   return Timer(duration, () {
    //     // Navigator.pushReplacementNamed(
    //     //     context, "welcome");
    //     Navigator.pushReplacementNamed(context, "base");
    //   });
    // }
  }

  startAnim(){
    Timer(Duration(milliseconds: 100),  (){ setState(() {
      opacity = 1.0;
    });});
  }

  bool loaded = false;
  @override
  Widget build(BuildContext context) {



    if(!loaded){
      startAnim();
      startSplashScreen();
      loaded = true;
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AnimatedOpacity(
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 1000),
                  opacity: opacity,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 300,
                    fit: BoxFit.fitWidth,
                  ),

                ),
              ),
              GenText("Versi "+buildNumber, style: TextStyle(color: Colors.black45),),
              SizedBox(height: 20,)

            ],
          ),
        ),
      ),
    );
  }
}
