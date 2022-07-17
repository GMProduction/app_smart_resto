import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../genColor.dart';
import '../../genText.dart';
import '../etc/genDimen.dart';
import '../etc/genShadow.dart';

class GenRadioGroupMini extends StatefulWidget {
  final List listData;
  final int initValue;
  final Function ontap;
  final String ? id, title , jumlah;
  final bool fitContent;
  final bool lineStyle;
  final double initPadding;
  final double radius;
  final EdgeInsets ? padding;

  GenRadioGroupMini({required this.listData,
    this.initValue = 0,
    required this.ontap,
    this.title,
    required this.id,
    this.fitContent = false,
    this.lineStyle = false,
    this.initPadding = 0,
    this.padding,
    this.radius = 50,
    this.jumlah});

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniState createState() => _GenRadioGroupMiniState();
}

class _GenRadioGroupMiniState extends State<GenRadioGroupMini> {
  var initValue = 0;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !widget.fitContent
          ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: widget.initPadding,
            ),
            Row(
              children: widget.listData.map<Widget>((e) {
                int index = e[widget.id];

                return initValue == index
                    ? Container(
                  padding:
                  widget.padding ?? EdgeInsets.all(0.03),
                  margin: EdgeInsets.only(
                      right: 0.02, bottom: 0.02, top: 5.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.radius),
                      color: GenColor.primaryColor,
                      boxShadow: GenShadow().genShadow(
                          radius: 3.w, offset: Offset(0, 2.w))),
                  child: Center(
                    child: GenText(
                      e[widget.title],
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                    : InkWell(
                    onTap: () {
                      setState(() {
                        initValue = e[widget.id];
                        widget.value = {
                          "id": e[widget.id],
                          "jumlah": e[widget.jumlah] ?? e[widget.id],
                        };
                      });
                    },
                    child: Container(
                      padding:
                      widget.padding ?? EdgeInsets.all(0.03),
                      margin: EdgeInsets.only(
                          right: 0.02, bottom: 0.02, top: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(widget.radius),
                          boxShadow: GenShadow().genShadow(),
                          color: Colors.white),
                      child: Center(
                          child: GenText(
                            e[widget.title],
                            style: TextStyle(color: Colors.black54),
                            textAlign: TextAlign.center,
                          )),
                    ));
              }).toList(),
            ),
          ],
        ),
      )
          : Container(
        width: double.infinity,
        child: Row(
          children: widget.listData.map<Widget>((e) {
            int index = e[widget.id];

            return widget.lineStyle
                ? initValue == index
                ? Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                margin: EdgeInsets.only(
                    right: 0.02, bottom: 0.02, top: 5.h),
                height: 80.h,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: GenColor.primaryColor, width: 2),
                    )),
                child: Center(
                  child: GenText(
                    e[widget.title],
                    style:
                    TextStyle(color: GenColor.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
                : Expanded(
              child: InkWell(
                  onTap: () {
                    setState(() {
                      initValue = e[widget.id];
                      widget.value = {
                        "id": e[widget.id],
                        "jumlah":
                        e[widget.jumlah] ?? e[widget.id],
                      };
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.w),
                      margin: EdgeInsets.only(
                          right: 0.02, bottom: 0.02, top: 5.h),
                      height: 80.h,
                      decoration: BoxDecoration(),
                      child: Center(
                        child: GenText(
                          e[widget.title],
                          style:
                          TextStyle(color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            )
                : initValue == index
                ? Expanded(
              child: Container(
                padding: EdgeInsets.all(10.w),
                margin: EdgeInsets.only(
                    right: 0.02, bottom: 0.02, top: 5.h),
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: GenColor.primaryColor,
                    boxShadow: GenShadow().genShadow(
                        color: GenColor.shadowMed,
                        radius: 3.w,
                        offset: Offset(0, 2.w))),
                child: Center(
                  child: GenText(
                    e[widget.title],
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
                : Expanded(
              child: InkWell(
                  onTap: () {
                    setState(() {
                      initValue = e[widget.id];
                      widget.value = {
                        "id": e[widget.id],
                        "jumlah":
                        e[widget.jumlah] ?? e[widget.id],
                      };
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    margin: EdgeInsets.only(
                        right: 0.02, bottom: 0.02, top: 5.h),
                    height: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: GenShadow().genShadow(
                            color: GenColor.shadowLigth,
                            radius: 3.w,
                            offset: Offset(0, 2.w)),
                        color: Colors.white),
                    child: Center(
                        child: GenText(
                          e[widget.title],
                          style: TextStyle(color: Colors.black54),
                          textAlign: TextAlign.center,
                        )),
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class GenRadioGroupMiniInString extends StatefulWidget {
  final List listData;
  final String ? initValue;
  final Function ontap;
  final String ? id, title;
  final bool fitContent;
  final bool lineStyle;
  final double initPadding;
  final EdgeInsets ? padding;

  GenRadioGroupMiniInString({required this.listData,
    this.initValue,
    required this.ontap,
    required this.title,
    required this.id,
    this.fitContent = false,
    this.lineStyle = false,
    this.initPadding = 0,
    this.padding});

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniInStringState createState() =>
      _GenRadioGroupMiniInStringState();
}

class _GenRadioGroupMiniInStringState extends State<GenRadioGroupMiniInString> {
  String ? initValue;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !widget.fitContent
          ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: widget.initPadding,
            ),
            Row(
              children: widget.listData.map<Widget>((e) {
                String index = e[widget.id];

                return initValue == index
                    ? Container(
                  padding:
                  widget.padding ?? EdgeInsets.all(0.03),
                  margin: EdgeInsets.only(
                      right: 0.02, bottom: 0.02, top: 5.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: GenColor.primaryColor,
                      boxShadow: GenShadow().genShadow(
                          color: GenColor.shadowMed,
                          radius: 3.w,
                          offset: Offset(0, 2.w))),
                  child: Center(
                    child: GenText(
                      e[widget.title],
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                    : InkWell(
                    onTap: () {
                      setState(() {
                        initValue = e[widget.id];
                        widget.value = {
                          "id": e[widget.id],
                          "name": e[widget.title]
                        };
                      });
                    },
                    child: Container(
                      padding:
                      widget.padding ?? EdgeInsets.all(0.03),
                      margin: EdgeInsets.only(
                          right: 0.02, bottom: 0.02, top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: GenShadow().genShadow(
                              color: GenColor.shadowLigth,
                              radius: 3,
                              offset: Offset(0, 2)),
                          color: Colors.white),
                      child: Center(
                          child: GenText(
                            e[widget.title] ?? "title",
                            style: TextStyle(color: Colors.black54),
                            textAlign: TextAlign.center,
                          )),
                    ));
              }).toList(),
            ),
          ],
        ),
      )
          : Container(
        width: double.infinity,
        child: Row(
          children: widget.listData.map<Widget>((e) {
            int index = e[widget.id];

            return widget.lineStyle
                ? initValue == index
                ? Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                margin: EdgeInsets.only(right: 20.w),
                height: 80.h,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: GenColor.primaryColor, width: 2),
                    )),
                child: Center(
                  child: GenText(
                    e[widget.title],
                    style:
                    TextStyle(color: GenColor.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
                : Expanded(
              child: InkWell(
                  onTap: () {
                    setState(() {
                      initValue = e[widget.id];
                      widget.value = {
                        "id": e[widget.id],
                      };
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.w),
                      margin: EdgeInsets.only(right: 20.w),
                      height: 80.h,
                      decoration: BoxDecoration(),
                      child: Center(
                        child: GenText(
                          e[widget.title],
                          style:
                          TextStyle(color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            )
                : initValue == index
                ? Expanded(
              child: Container(
                padding: EdgeInsets.all(10.w),
                margin:
                EdgeInsets.only(right: 20.w, bottom: 20.w),
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: GenColor.primaryColor,
                    boxShadow: GenShadow().genShadow(
                        color: GenColor.shadowMed,
                        radius: 3.w,
                        offset: Offset(0, 2.w))),
                child: Center(
                  child: GenText(
                    e[widget.title],
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
                : Expanded(
              child: InkWell(
                  onTap: () {
                    setState(() {
                      initValue = e[widget.id];
                      widget.value = {
                        "id": e[widget.id],
                      };
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    margin: EdgeInsets.only(
                        right: 20.w, bottom: 20.w),
                    height: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: GenShadow().genShadow(
                            color: GenColor.shadowLigth,
                            radius: 3.w,
                            offset: Offset(0, 2.w)),
                        color: Colors.white),
                    child: Center(
                        child: GenText(
                          e[widget.title],
                          style: TextStyle(color: Colors.black54),
                          textAlign: TextAlign.center,
                        )),
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class GenRadioGroupMiniString extends StatefulWidget {
  final List listData;
  final String initValue;
  final Function ontap;
  final String id;
  final bool fitContent;
  final bool reverseColor;
  final EdgeInsets ? padding;
  final double radius;
  final double ? marginHorz;

  GenRadioGroupMiniString({
    required this.listData,
    this.initValue = "",
    required this.ontap,
    required this.id,
    this.fitContent = false,
    this.padding,
    this.reverseColor = false,
    this.radius = 50,
    this.marginHorz,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniStringState createState() =>
      _GenRadioGroupMiniStringState();
}

class _GenRadioGroupMiniStringState extends State<GenRadioGroupMiniString> {
  var initValue = "";

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: !widget.fitContent
          ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: GenDimen.sidePadding,
            ),
            Row(
              children: widget.listData.map<Widget>((e) {
                String index = e[widget.id];

                return initValue == index
                    ? Container(
                  padding:
                  widget.padding ?? EdgeInsets.all(0.03),
                  margin: EdgeInsets.only(
                      right: widget.marginHorz ?? 0.02,
                      bottom: widget.marginHorz ?? 0.02,
                      top: 10.w),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(widget.radius),
                      color: widget.reverseColor
                          ? Colors.white
                          : GenColor.primaryColor,
                      boxShadow: GenShadow().genShadow(
                          color: GenColor.shadowMed,
                          radius: widget.reverseColor ? 0 : 3.w,
                          offset: Offset(0, 2.w))),
                  child: Center(
                    child: GenText(
                      e[widget.id],
                      style: TextStyle(
                          color: widget.reverseColor
                              ? GenColor.primaryColor
                              : Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                    : InkWell(
                    onTap: () {
                      setState(() {
                        print("id nya : " + e[widget.id].toString());
                        initValue = e[widget.id].toString();
                        widget.value = {
                          "id": e[widget.id].toString(),
                        };
                      });
                    },
                    child: Container(
                      padding:
                      widget.padding ?? EdgeInsets.all(0.03),
                      margin: EdgeInsets.only(
                          right: widget.marginHorz ?? 0.02,
                          bottom: widget.marginHorz ?? 0.02,
                          top: 10.w),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(widget.radius),
                          boxShadow: GenShadow().genShadow(
                              color: GenColor.shadowLigth,
                              radius: widget.reverseColor ? 0 : 3.w,
                              offset: Offset(0, 2.w)),
                          border: Border.all(
                              color: widget.reverseColor
                                  ? Colors.white
                                  : Colors.transparent),
                          color: widget.reverseColor
                              ? GenColor.primaryColor
                              : Colors.white),
                      child: Center(
                          child: GenText(
                            e[widget.id],
                            style: TextStyle(
                                color: widget.reverseColor
                                    ? Colors.white
                                    : Colors.black54),
                            textAlign: TextAlign.center,
                          )),
                    ));
              }).toList(),
            ),
          ],
        ),
      )
          : Container(
        width: double.infinity,
        child: Row(
          children: widget.listData.map<Widget>((e) {
            var index = e[widget.id];

            return initValue == index
                ? Expanded(
              child: Container(
                padding: EdgeInsets.all(0.03),
                margin: EdgeInsets.only(
                    right: 0.02, bottom: 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: GenColor.primaryColor,
                    boxShadow: GenShadow().genShadow(
                        color: GenColor.shadowMed,
                        radius: 3.w,
                        offset: Offset(0, 2.w))),
                child: Center(
                  child: GenText(
                    e[widget.id],
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
                : Expanded(
              child: InkWell(
                  onTap: () {
                    setState(() {
                      initValue = e[widget.id];
                      widget.value = {
                        "id": e[widget.id],
                      };
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(0.03),
                    margin: EdgeInsets.only(
                        right: 0.02, bottom: 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: GenShadow().genShadow(
                            color: GenColor.shadowLigth,
                            radius: 3.w,
                            offset: Offset(0, 2.w)),
                        color: Colors.white),
                    child: Center(
                        child: GenText(
                          e[widget.id],
                          style: TextStyle(color: Colors.black54),
                          textAlign: TextAlign.center,
                        )),
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

