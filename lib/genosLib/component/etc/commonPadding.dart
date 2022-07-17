import 'package:flutter/material.dart';

import 'genDimen.dart';

class CommonPadding extends StatelessWidget {

  final EdgeInsets? padding;
  final Widget? child;

  const CommonPadding({Key? key, this.padding, @required this.child})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.only(
            right: GenDimen.sidePadding,
            left: GenDimen.sidePadding),
        child: child);
  }
}
