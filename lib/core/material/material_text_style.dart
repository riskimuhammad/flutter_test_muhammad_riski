import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';

class MaterialTextStyle {
  TextStyle normalTextStyleCPrimary =
      TextStyle(fontSize: 15, color: BionicColors.primaryColor);
  TextStyle normalTextStyleCPrimaryDarkBold = TextStyle(
      fontSize: 15,
      color: BionicColors.primaryColorDark,
      fontWeight: FontWeight.bold);
  TextStyle normalTextStyleCBlack =
      TextStyle(fontSize: 15, color: BionicColors.black);
  TextStyle normalTextStyleCGray =
      TextStyle(fontSize: 15, color: BionicColors.greyDark);
  TextStyle mediumTextStyleCWhite =
      TextStyle(fontSize: 17, color: BionicColors.white);
  TextStyle textStyleCBlackFZ20 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: BionicColors.black);
}

MaterialTextStyle materialTextStyle = MaterialTextStyle();
