import 'package:flutter/material.dart';

import 'material_color.dart';
import 'material_text_style.dart';

class MaterialDecoration {
  inputDecoration({String? hintText}) {
    return InputDecoration(
        hintStyle: materialTextStyle.normalTextStyleGrey,
        hintText: hintText,
        contentPadding: EdgeInsets.only(left: 16, right: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: BionicColors.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: BionicColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: BionicColors.primaryColor)));
  }

  buttonStyle({Size? size}) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(BionicColors.primaryColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        fixedSize: MaterialStateProperty.all(size));
  }
}

MaterialDecoration materialDecoration = MaterialDecoration();
