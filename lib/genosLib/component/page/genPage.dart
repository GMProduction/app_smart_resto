import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../genColor.dart';


class GenPage extends StatelessWidget {



  final Color? statusBarColor;
  final Widget? sidebarDrawer;
  final Widget? body;
  final Widget? appbar;
  final AppBar? realAppBar;
  final GlobalKey? genKey;
  final Map? routes;
  final BottomNavigationBar? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;

  GenPage(
      {this.statusBarColor,
      this.genKey,
      this.sidebarDrawer,
      this.body,
      this.appbar,
      this.routes,
      this.bottomNavigationBar, this.realAppBar,
      this.floatingActionButton
      });




  @override
  Widget build(BuildContext context) {



    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor ?? Colors.white, // status bar color
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark
    ));


    return realAppBar == null ? Scaffold(
      key: genKey,
      drawer: sidebarDrawer,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            appbar == null
                ? Container()
                : Container(
                    child: appbar
                  ),
            Expanded(
              child: body!,
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    ) : Scaffold(
      key: genKey,
      appBar: realAppBar,
      drawer: sidebarDrawer,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(),
            Expanded(
              child: body!,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
    throw UnimplementedError();
  }
}
