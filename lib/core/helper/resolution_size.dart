import 'package:flutter/material.dart';

SizedBox normalResolutionSizeHeight = SizedBox(
  height: 10,
);
SizedBox mediumResolutionSizeHeight = SizedBox(
  height: 15,
);
SizedBox largeResolutionSizeHeight = SizedBox(
  height: 25,
);

SizedBox normalResolutionSizeWidth = SizedBox(
  width: 10,
);
SizedBox mediumResolutionSizeWidth = SizedBox(
  width: 15,
);
SizedBox largeResolutionSizeWidth = SizedBox(
  width: 25,
);

customResolutionSize({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}
