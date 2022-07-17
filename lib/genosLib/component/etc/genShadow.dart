import 'package:flutter/material.dart';

import '../../genColor.dart';



class GenShadow {

  static double dimen = 1;
  static Color? color;
  static Offset? offset;

  List<BoxShadow> genShadow({double? radius, Offset? offset, Color? color}){
    return  [
      BoxShadow(
        spreadRadius: radius != null ? radius : dimen,
        color: color != null ? color : color ?? GenColor.shadowLigth2,
        offset: offset ?? Offset(dimen, dimen),
        blurRadius: radius != null ? radius : dimen,),

    ];
  }
}
