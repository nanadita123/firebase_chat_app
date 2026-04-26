import 'package:flutter/material.dart';

class AppSpacing {
  // 🔹 Dynamic (use any size)
  static SizedBox v(double height) => SizedBox(height: height);
  static SizedBox h(double width) => SizedBox(width: width);

  // 🔹 Common vertical spaces
  static const v4 = SizedBox(height: 4);
  static const v6 = SizedBox(height: 6);
  static const v8 = SizedBox(height: 8);
  static const v12 = SizedBox(height: 12);
  static const v16 = SizedBox(height: 16);
  static const v20 = SizedBox(height: 20);
  static const v24 = SizedBox(height: 24);
  static const v32 = SizedBox(height: 32);
  static const v40 = SizedBox(height: 40);
  static const v48 = SizedBox(height: 48);
  static const v64 = SizedBox(height: 64);

  // 🔹 Common horizontal spaces
  static const h4 = SizedBox(width: 4);
  static const h8 = SizedBox(width: 8);
  static const h10 = SizedBox(width: 10);
  static const h12 = SizedBox(width: 12);
  static const h16 = SizedBox(width: 16);
  static const h20 = SizedBox(width: 20);
  static const h24 = SizedBox(width: 24);
}