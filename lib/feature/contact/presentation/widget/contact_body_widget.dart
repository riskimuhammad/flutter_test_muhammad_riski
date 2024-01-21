import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_test_muhammad_riski/core/helper/resolution_size.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';
import 'package:flutter_test_muhammad_riski/feature/contact/presentation/controller/contact_controller.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ContactBodyWidget {
  final controller = Get.find<ContactController>();
  body(context) {
    return Obx(() => Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16, top: 16),
              decoration: BoxDecoration(
                  color: BionicColors.primaryColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () => controller.createExternalContact(),
                title: Text(
                  'Tambah kontak',
                  style: materialTextStyle.normalTextStyle,
                ),
                leading: Icon(
                  PhosphorIcons.userPlus(PhosphorIconsStyle.regular),
                  color: BionicColors.white,
                ),
              ),
            ),
            controller.contactsList.isEmpty
                ? _isLoading()
                : Expanded(
                    child: ListView.builder(
                      itemCount: controller.contactsList.length,
                      itemBuilder: (context, index) =>
                          Obx(() => controller.validationDataEntry(
                                child: _isNotEmptyContact(
                                    context, controller.contactsList[index]),
                                emptyData: _isEmptyContact(),
                              )),
                    ),
                  ),
          ],
        )));
  }

  _isLoading() {
    return Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          color: BionicColors.primaryColor,
        ),
      ),
    );
  }

  _isEmptyContact() {
    return Column(
      children: [
        Icon(
          PhosphorIcons.chatCircleText(PhosphorIconsStyle.regular),
        ),
        Text('Ayo mulai chat dengan menambahkan kontak terlebih dahulu'),
      ],
    );
  }

  _isNotEmptyContact(context, Contact? contact) {
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
              Text(
                contact!.displayName,
                style: materialTextStyle.normalTextStyle,
              ),
              normalResolutionSizeHeight,
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Text(
                  contact.phones.isEmpty
                      ? ""
                      : contact.phones.first.normalizedNumber,
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
