import 'package:hrapp/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgress extends StatefulWidget {
  final double size;
  final Color color;

  CustomProgress({this.size = 30, this.color = blackColor});

  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: widget.color,
      size: widget.size,
    );
  }
}
