import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/entity/chat_by_id_data_entity.dart';

import '../../../../core/helper/resolution_size.dart';
import '../../../../core/material/material_text_style.dart';

class CardChat {
  chat(context, ChatByIdDataEntity? data) {
    return Container(
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
              Row(
                children: [
                  Text(
                    data!.disPlayName!,
                    style: materialTextStyle.normalTextStyle,
                  )
                ],
              ),
              normalResolutionSizeHeight,
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Text(
                  data.message!,
                  style: materialTextStyle.normalTextStyleGrey,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
