// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String? imageName;
  final double? imageHeight, imageWidth;
  const CustomImage({
    Key? key,
    this.imageName,
    this.imageHeight,
    this.imageWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageName!,
      height: imageHeight,
      width: imageWidth,
    );
  }
}
