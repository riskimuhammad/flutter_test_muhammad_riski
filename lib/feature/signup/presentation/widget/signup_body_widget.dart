import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_muhammad_riski/core/helper/resolution_size.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_decoration.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBodyWidget {
  final controller = Get.find<SignupController>();
  body(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 50, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Masukkan Nomor telepon Anda',
                style: materialTextStyle.normalTextStyle,
              ),
              normalResolutionSizeHeight,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'AyoChat perlu memverifikasi akun Anda. ',
                    style: materialTextStyle.normalTextStyle),
                TextSpan(
                    text: 'Berapa nomor telepon saya ?',
                    style: materialTextStyle.normalTextStyleCPrimary),
              ])),
              largeResolutionSizeHeight,
              SizedBox(
                child: Obx(
                  () => DropdownButtonFormField(
                      isExpanded: true,
                      dropdownColor: BionicColors.primaryColor,
                      iconEnabledColor: BionicColors.primaryColor,
                      decoration: materialDecoration.inputDecoration(),
                      items: controller.listCountry
                          .map((element) => DropdownMenuItem(
                                child: Text(
                                  element.name!,
                                  style: materialTextStyle.normalTextStyleW500,
                                ),
                                value: element.dialCode!,
                              ))
                          .toList(),
                      value: controller.selectCountry.value,
                      onChanged: controller.onChangeCountry),
                ),
              ),
              customResolutionSize(height: 30),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: BionicColors.primaryColor, width: 1)),
                    child: Obx(() => Text(
                          controller.selectCountry.value,
                          style: materialTextStyle.mediumTextStyleCPrimary,
                        )),
                  ),
                  normalResolutionSizeWidth,
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: controller.noTlpnController.value,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: materialTextStyle.normalTextStyle,
                        cursorColor: BionicColors.primaryColor,
                        decoration: materialDecoration.inputDecoration(
                            hintText: 'Nomor Telepon'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: () => controller.validationSendOtp(context),
              child: Obx(() => controller.nextButtonValidationWidget(
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: BionicColors.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Lanjut',
                    style: materialTextStyle.normalTextStyle,
                  ))),
              style: materialDecoration.buttonStyle(size: Size(100, 45)),
            ),
          ),
        ],
      ),
    );
  }
}
