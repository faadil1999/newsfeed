import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';

class TexteFaadil extends Text {

  TexteFaadil (String data ,{textAlign: TextAlign.center , color: Colors.blue , fontSize: 15.0, fontStyle: FontStyle.normal}):
    super(
      data,
      textAlign: textAlign,
      style: new TextStyle(
        color: color,
        fontSize: fontSize,
        fontStyle: fontStyle
      )
    );




}