import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextStyle {

  static TextStyle black() {
    return TextStyle(
      color: Colors.black,
    );
  }

  static TextStyle blackbold() {
    return black().merge(
      TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
    );
  }
}
