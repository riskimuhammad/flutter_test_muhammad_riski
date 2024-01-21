import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/helper/resolution_size.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';

import '../../../../core/material/material_text_style.dart';

class EndToEnChatAppbar {
  appBar(context, displayName) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      decoration: BoxDecoration(
          color: BionicColors.primaryColorDark,
          boxShadow: [
            BoxShadow(
                color: BionicColors.greyDark,
                blurRadius: 5,
                offset: Offset(-3, -3))
          ]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 15,
            backgroundImage: NetworkImage(
                'https://www.sunsetlearning.com/wp-content/uploads/2019/09/User-Icon-Grey.png'),
          ),
          largeResolutionSizeWidth,
          Text(
            displayName,
            style: materialTextStyle.normalTextStyle,
          )
        ],
      ),
    );
  }
}
