import 'package:flutter/material.dart';

class GenCloseModalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: 50,
          child: Container(
              alignment: Alignment(1, 0),
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.cancel,
                color: Colors.redAccent,
              )),
        ),
      ),
    );
  }
}
