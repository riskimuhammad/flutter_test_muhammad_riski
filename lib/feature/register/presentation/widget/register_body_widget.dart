import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/helper/resolution_size.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';
import 'package:flutter_test_muhammad_riski/feature/register/presentation/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBody {
  final controller = Get.find<RegisterController>();
  body(context) {
    return Positioned(
      top: 180,
      bottom: 0,
      left: 20,
      right: 20,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Lorem Ipsum',
              style: materialTextStyle.textStyleCBlackFZ20,
            ),
            largeResolutionSizeHeight,
            _textFormfield(
                controller: controller.nameController.value, hinText: 'Name'),
            normalResolutionSizeHeight,
            _textFormfield(
                controller: controller.emailController.value,
                hinText: 'E-mail'),
            normalResolutionSizeHeight,
            _textFormfield(
                controller: controller.passwordController.value,
                hinText: 'Password'),
            customResolutionSize(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberCheck.value,
                          onChanged: controller.onChageRemember),
                    ),
                    Text(
                      'Remember',
                      style: materialTextStyle.normalTextStyleCBlack,
                    )
                  ],
                ),
                Text(
                  'Lorem Ipsum ?',
                  style: materialTextStyle.normalTextStyleCPrimaryDarkBold,
                ),
              ],
            ),
            largeResolutionSizeHeight,
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(BionicColors.primaryColorDark),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                  fixedSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50)),
                ),
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: materialTextStyle.mediumTextStyleCWhite,
                )),
            customResolutionSize(height: 100),
            Text(
              'Lorem Ipsum is simply dummy tex',
              style: materialTextStyle.normalTextStyleCGray,
            ),
            Text(
              'New Password',
              style: materialTextStyle.normalTextStyleCPrimaryDarkBold,
            )
          ],
        ),
      ),
    );
  }

  _textFormfield({TextEditingController? controller, String? hinText}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hinText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: BionicColors.grey,
              ))),
    );
  }
}
