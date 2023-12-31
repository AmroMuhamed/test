
import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height - 40);

    path.quadraticBezierTo(

        size.width / 4, size.height - 80, size.width / 2, size.height - 40);

    path.quadraticBezierTo(size.width - (size.width / 4), size.height,

        size.width, size.height - 40);

    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(Clipper oldClipper) => false;
}