import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../genColor.dart';

class HeaderProfile extends StatelessWidget {
  final double? photoSize;
  final String? image;
  final Widget? child;
  final CrossAxisAlignment? vAlign;

  const HeaderProfile({Key? key, this.photoSize, @required this.child, this.image, this.vAlign}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: vAlign ?? CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: GenColor.primaryColor,
          ),
          width: photoSize ?? 120,
          height: photoSize ?? 120,
          child: ClipOval(child: image != null ? Image.network(image!, width: photoSize ?? 120.w, height: photoSize ?? 120.w, fit: BoxFit.cover,) : Image.asset("assets/images/logotok.png",  width: 30.w, fit: BoxFit.fitWidth, )),
        ),
        SizedBox(width: 10 ),
        Expanded(child: child!)
      ],
    );
  }
}
