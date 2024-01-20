import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/helper/resolution_size.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';

class ChatBodyWidget {
  body(context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.sunsetlearning.com/wp-content/uploads/2019/09/User-Icon-Grey.png'),
              ),
              normalResolutionSizeWidth,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '+6285156006526',
                    style: materialTextStyle.normalTextStyle,
                  ),
                  normalResolutionSizeHeight,
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90,
                    child: Text(
                      'Hi, there! djashdksajhdkashdk ashdk jashdkashdkashdkasdhkasdhkashdkhask',
                      style: materialTextStyle.normalTextStyleGrey,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
