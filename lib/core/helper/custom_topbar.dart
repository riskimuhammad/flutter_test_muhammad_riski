import 'package:flutter/material.dart';
import 'custom_helper.dart';

class CutomTopBar {
  topBar({Color? color, Widget? child}) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 200,
                color: color,
              ),
            )),
        child!,
      ],
    );
  }
}
