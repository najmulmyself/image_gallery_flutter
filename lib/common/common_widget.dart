import 'package:flutter/material.dart';

class CommonWidgets {
  static TextStyle appBarTitleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  static Container arrowBack() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white38, borderRadius: BorderRadius.circular(10.0)),
      child: const Center(
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
    );
  }
}
