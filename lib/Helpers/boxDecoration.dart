


// ignore_for_file: file_names

import 'package:flutter/material.dart';

  boxDecoration(color){

  return BoxDecoration(
    color:color,
    borderRadius: const BorderRadius.all(Radius.circular(15.0) //
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        blurRadius: 6,
        offset: const Offset(3, 3), // changes position of shadow
      ),
    ],

  );
}