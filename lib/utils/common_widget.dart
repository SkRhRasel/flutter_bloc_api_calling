import 'package:flutter/material.dart';
import 'package:flutter_bloc_api_calling/utils/text_utils.dart';

Widget handleEmptyViewWithLoading(bool isLoading,
    {double height = 50, String? message}) {
  String _message = message ?? "Sorry! Data not found";
  return Container(
      margin: const EdgeInsets.all(20),
      height: height,
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : textAutoSizeForGallery(
                text: _message,
                maxLines: 2,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
      ));
}
