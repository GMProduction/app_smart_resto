import 'package:flutter/material.dart';

class GenText extends StatelessWidget {
  final String txt;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  GenText(this.txt, {this.style, this.overflow, this.maxLines, this.textAlign});
  @override
  Widget build(BuildContext context) {
    TextStyle newStyle = style == null
        ? TextStyle(fontFamily: 'Nunito')
        : style!.apply(fontFamily: 'Nunito');
    return Text(
      txt,
      overflow: overflow,
      maxLines: maxLines,
            style: newStyle,
      textAlign: textAlign == null ? TextAlign.left : textAlign,
    );
    throw UnimplementedError();
  }
}
