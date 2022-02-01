import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

const dateFormatYyyyMMDd = "yyyy-MM-dd";
const dateTimeFormatYyyyMMDdHhMm = "yyyy-MM-dd kk:mm";
const dateFormatMMDdYyyy = "MM/dd/yyyy";
const dateFormatMMMMDdDyyy = "MMMM dd, yyyy";
const dateTimeFormatDdMMMMYyyyHhMm = "dd MMMM yyyy | hh:mm a";

void showToast(String text, {bool isError = false, bool isLong = false}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? Colors.red : Colors.red ,
    textColor: Colors.white,
    //fontSize: 16.0
  );
}

String stringNullCheck(String? value) {
  return value ?? "";
}

void editTextFocusDisable(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

String getEnumString(dynamic enumValue) {
  String string = enumValue.toString();
  try {
    string = string.split(".").last;
    return string;
  } catch (_) {}
  return "";
}

String amountFormat(dynamic amount) {
  String amountStr = "00.0";
  if (amount != null) {
    double amaDo = makeDouble(amount);
    amountStr = amaDo.toStringAsFixed(2);
  }
  return "$amountStr €";
}

String distanceFormat(dynamic distance) {
  String distanceStr = "0";
  if (distance != null) {
    var kmDis = makeDouble(distance);
    distanceStr = kmDis < 1 ? "1" : kmDis.toStringAsFixed(2);
  }
  return "$distanceStr KM";
}

double makeDouble(dynamic value) {
  if (value == null) {
    return 0.0;
  }
  if (value is String && value.isNotEmpty) {
    return double.parse(value);
  } else if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  }
  return 0.0;
}

DateTime? makesDate(Map<String, dynamic> json, String key, {bool isDefault = false}) {
  if (json.containsKey(key)) {
    var value = json[key];
    if (value is String && value.isNotEmpty) {
      if (!value.contains("z") && !value.contains("Z")) {
        value = value + "Z";
      }
      return DateTime.parse(value);
    }
  }
  if (isDefault) {
    return DateTime.now();
  }
  return null;
}

int makeInt(dynamic value) {
  if (value is String && value.isNotEmpty) {
    return int.parse(value);
  } else if (value is double) {
    return value.toInt();
  } else if (value is int) {
    return value;
  }
  return 0;
}

bool isValidPassword(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{6,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

Future<String> htmlString(String path) async {
  String fileText = await rootBundle.loadString(path);
  String htmlStr =
      Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString();
  return htmlStr;
}

/// *** APP CUSTOM VIEWS ***///

// String getUserName(User? user) {
//   String name = "";
//   String firstName = stringNullCheck(user?.firstName);
//   String latsName = stringNullCheck(user?.lastName);
//   if (firstName.isNotEmpty) {
//     name = firstName;
//   }
//   if (latsName.isNotEmpty) {
//     name = name + " " + latsName;
//   }
//   return name;
// }

String getName(String? firstName, String? lastName) {
  String name = "";
  String fName = stringNullCheck(firstName);
  String lName = stringNullCheck(lastName);
  if (fName.isNotEmpty) {
    name = fName;
  }
  if (lName.isNotEmpty) {
    name = name + " " + lName;
  }
  return name;
}

