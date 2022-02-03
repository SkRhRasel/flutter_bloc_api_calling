import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

Widget textAutoSizeForGallery({required String text, VoidCallback? onTap, double hMargin = 0,
  int maxLines = 1, Color? color, FontWeight fontWeight = FontWeight.normal, double? width,
  TextAlign textAlign = TextAlign.start, double fontSize = 16,TextDecoration? decoration }) {

  var colorL = color ?? primaryDark;
  var widthL = width ?? double.infinity;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: 12,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(color: colorL, fontWeight: fontWeight, fontSize: fontSize,decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}