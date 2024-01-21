import 'package:flutter/material.dart';

import 'package:flutter_test_muhammad_riski/feature/chat/domain/entity/chat_by_id_data_entity.dart';
import 'package:get/get.dart';

import '../../../../core/helper/resolution_size.dart';
import '../../../../core/helper/route_helper.dart';
import '../../../../core/material/material_color.dart';
import '../../../../core/material/material_text_style.dart';

class CardChat {
  chat(context, doc, ChatByIdDataEntity? data) {
    return GestureDetector(
      onTap: () => Get.toNamed(routeHelper.toEndToEndChat, arguments: {
        'doc': doc,
        'rechiver': data.rechiver,
        'send_by': data.sendBy,
        'send_name': data.disPlayName,
        'id': data.id
      }),
      child: Container(
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
                      data!.disPlayName ?? '',
                      style: materialTextStyle.normalTextStyle,
                    )
                  ],
                ),
                normalResolutionSizeHeight,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 90,
                  child: Text(
                    data.message ?? '',
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
    );
  }

  roomChatCard(ChatByIdDataEntity? data, service) {
    return Column(
      crossAxisAlignment: service == data!.sendBy
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
          child: Text(
            data.time!.toDate().toString(),
            style: materialTextStyle.smallTextStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
              bottom: 20,
              right: service == data.sendBy ? 20 : 150,
              left: service == data.sendBy ? 150 : 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: service == data.sendBy
                ? BionicColors.orangeDark.withOpacity(.3)
                : BionicColors.primaryColor.withOpacity(.3),
          ),
          child: Text(
            data.message!,
            style: materialTextStyle.normalTextStyle,
          ),
        ),
      ],
    );
  }
}
