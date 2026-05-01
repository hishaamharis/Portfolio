import 'package:flutter/animation.dart';

class AppMotion {
  AppMotion._();

  static const Duration hover = Duration(milliseconds: 200);
  static const Duration reveal = Duration(milliseconds: 600);
  static const Duration route = Duration(milliseconds: 400);
  static const Duration signature = Duration(milliseconds: 1200);

  static const Cubic easeOut = Cubic(0.22, 1, 0.36, 1);
  static const Cubic easeInOut = Cubic(0.65, 0, 0.35, 1);
}
