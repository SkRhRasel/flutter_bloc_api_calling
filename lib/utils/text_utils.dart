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

Widget textSpanForGallery({required String title, required String subTitle, VoidCallback? onTap, double hMargin = 0,
  int maxLines = 1, Color? color, FontWeight fontWeight = FontWeight.normal, double? width,
  TextAlign textAlign = TextAlign.start, double fontSize = 16,TextDecoration? decoration }) {

  var colorL = color ?? primaryDark;
  var widthL = width ?? double.infinity;
  return Container(
    width: widthL,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: AutoSizeText.rich(
      TextSpan(
        text: title,
        style: TextStyle(color: colorL, fontSize: 16, fontWeight: FontWeight.bold,decoration: decoration),
        children: <TextSpan>[
          TextSpan(
            text: subTitle,
            style: TextStyle(color: colorL, fontSize: 14, fontWeight: FontWeight.w100, decoration: decoration),
          ),
        ],
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    ),
  );
}