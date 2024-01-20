import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChatAppbarWidget {
  appBar() {
    return PreferredSize(
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                  PhosphorIcons.dotsThreeVertical(PhosphorIconsStyle.regular)),
            )
          ],
          title: Text(
            'AyoChat',
            style: materialTextStyle.mediumTextStyleCPrimary,
          ),
        ),
        preferredSize: Size.fromHeight(50));
  }
}
