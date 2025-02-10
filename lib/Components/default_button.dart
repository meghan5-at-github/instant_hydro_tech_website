import 'package:flutter/material.dart';

import '../constant.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Function? press;
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          side: BorderSide(color: kPrimaryColor), // Border color
        ),
        onPressed: ()=>press,
        child: Text(
          text?.toUpperCase() ?? "",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
