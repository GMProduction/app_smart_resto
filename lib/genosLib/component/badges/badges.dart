import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../genText.dart';

class Badgesred extends StatelessWidget {
  final String text;


  const Badgesred(
      {Key? key,
        this.text = "",
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(badgeContent: GenText(text, style: TextStyle(color: Colors.white),));
  }
}



