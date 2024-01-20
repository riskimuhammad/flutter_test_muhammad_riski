import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:another_flushbar/flushbar.dart';
import '../material/material_text_style.dart';

class DialogHelper {
  static snackBarHelper(context, {message}) {
    Flushbar(
      messageText: Text(
        message,
        style: materialTextStyle.normalTextStyle,
      ),
      icon: Icon(
        PhosphorIcons.info(PhosphorIconsStyle.fill),
        size: 28.0,
        color: BionicColors.primaryColor.withOpacity(.3),
      ),
      padding: EdgeInsets.only(top: 16, bottom: 16),
      duration: Duration(seconds: 3),
      backgroundColor: BionicColors.primaryColor,
      margin: EdgeInsets.only(left: 16, right: 16, top: 40),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(10),
    )..show(context);
  }
}
