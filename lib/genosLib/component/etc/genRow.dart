import 'package:flutter/cupertino.dart';

import '../../genText.dart';

class RowSpaceBetween extends StatelessWidget {
  final Widget? chilidLeft;
  final Widget? childRight;
  final double? paddingHorz;
  final double? paddingVert;
  RowSpaceBetween({this.chilidLeft, this.childRight, this.paddingHorz, this.paddingVert});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingHorz ?? 12, vertical: paddingVert ?? 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          chilidLeft ?? Container(),
          childRight ?? Container(),
        ],
      ),
    );
  }
}
