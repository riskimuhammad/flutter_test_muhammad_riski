import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/helper/resolution_size.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_decoration.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerificationCodeBodyWidget {
  final controller = Get.find<SignupController>();
  body(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kode Verifikasi',
            style: materialTextStyle.largeTextStyle,
          ),
          largeResolutionSizeHeight,
          Text(
            'Masukkan kode verifikasi dibawah ini yang sudah anda dapatkan sebelumnya.',
            style: materialTextStyle.normalTextStyleGrey,
          ),
          largeResolutionSizeHeight,
          SizedBox(
            height: 45,
            child: OTPTextField(
                otpFieldStyle: OtpFieldStyle(
                  borderColor: BionicColors.primaryColor,
                  backgroundColor: BionicColors.greyDark.withOpacity(.3),
                  focusBorderColor: BionicColors.primaryColor,
                  enabledBorderColor: BionicColors.primaryColor,
                ),
                controller: controller.otpController.value,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 5,
                style: materialTextStyle.normalTextStyle,
                onChanged: (pin) {},
                onCompleted: (pin) =>
                    controller.verificationCode(pin, context)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => controller.sendOtp(context),
                  child: Text(
                    'Kirim Ulang Kode ?',
                    style: materialTextStyle.normalTextStyleCPrimary,
                  )),
              Obx(() => Text(
                    "00:${controller.verificationTimer.value}",
                    style: materialTextStyle.normalTextStyle,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
