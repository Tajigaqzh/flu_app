import 'dart:math' as math;

abstract final class MathUtil {
  MathUtil._();
  static const double epsilon = 1e-6;
  static const double pi = math.pi;

  static const rotatePi = math.pi;
  static const rotateHalfPi = math.pi / 2;
  static const rotateQuarterPi = math.pi / 4;
  static const rotateThreeQuartersPi = math.pi * 3 / 4;
  static const rotateTwoPi = math.pi * 2;
  static const rotateThreePi = math.pi * 3;

}