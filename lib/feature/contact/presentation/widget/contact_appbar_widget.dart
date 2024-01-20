import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';

class ContactAppBarWidget {
  appBar() {
    return PreferredSize(
        child: AppBar(
          title: Text(
            'AyoChat',
            style: materialTextStyle.mediumTextStyleCPrimary,
          ),
        ),
        preferredSize: Size.fromHeight(50));
  }
}
