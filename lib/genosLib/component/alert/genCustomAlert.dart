import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../genColor.dart';
import '../../genText.dart';
import 'GenCloseModalButton.dart';

GenCustomAlert(BuildContext context, String judul,
    {String? img, String? isi, Widget? body, double? height, Widget? bodyAll}) {
  //Setting Modal BottomSheet
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return bodyAll != null ? bodyAll : Container(
            padding: EdgeInsets.all(10.w),
            height: height ?? ScreenUtil().setHeight(800.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
//                  Container(
//                      width: MediaQuery.of(context).size.width,
//                      child: GenCloseModalButton()),
                  img != null ? Container(padding: EdgeInsets.all(8.h), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: GenColor.primaryColor),child: Image.asset(img, height: ScreenUtil().setHeight(200.h), width: 200.h, fit: BoxFit.fitHeight,)) : Container(),
                  Spacer(flex: 1,),
                  judul == null ? Container() : Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      judul,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  isi != null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: GenText(
                            isi,
                            style: TextStyle(fontSize: 25),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(),
                  SizedBox(height: 30.h,),
                  body ?? Container()
                ]));
      });
}
