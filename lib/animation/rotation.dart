// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';

class Rotation {
  final double x;
  final double y;
  final double z;

  const Rotation.radians({this.x = 0, this.y = 0, this.z = 0});

  Rotation.deg({double x = 0, double y = 0, double z = 0})
      : this.radians(x: radians(x), y: radians(y), z: radians(z));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Rotation &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y &&
          z == other.z;

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ z.hashCode;
}
