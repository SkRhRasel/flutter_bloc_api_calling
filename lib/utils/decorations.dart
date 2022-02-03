import 'package:flutter/material.dart';
import 'colors.dart';

getRoundCornerWithShadow({Color color = white}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(Radius.circular(7)),
    // borderRadius: BorderRadius.only(
    //   topLeft: Radius.circular(dp15),
    //   topRight: Radius.circular(dp15),
    // ),
    //boxShadow: kElevationToShadow[1]
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 1,
          offset: const Offset(1, 1) // Shadow position
          //       // color: Colors.grey.withOpacity(0.8),
          //       // spreadRadius: 10,
          //       // blurRadius: 5,
          //       // offset: Offset(0, 7),
          ),
    ],
  );
}

getRoundCornerBorderOnlyTopForGallery({Color bgColor = white}) {
  return BoxDecoration(
    // image: DecorationImage(
    //     image: getImage(stringNullCheck(auction.productImageUrl), true),
    //     fit: BoxFit.cover),
    color: bgColor,
    borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
  );
}

getRoundCornerBorderOnlyBottomForGallery() {
  return const BoxDecoration(
    color: white,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
  );
}
