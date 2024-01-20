import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_muhammad_riski/core/helper/route_helper.dart';
import 'package:flutter_test_muhammad_riski/core/service/local/otp_service.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/domain/entity/country_entity.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:otp_text_field/otp_field.dart';

import '../../../../core/helper/dialog_helper.dart';

class SignupController extends GetxController {
  final otpService = LocalService();
  Rx<OtpFieldController> otpController = OtpFieldController().obs;
  RxList<CountryEntity> listCountry = <CountryEntity>[].obs;
  Rx<TextEditingController> noTlpnController =
      TextEditingController(text: '').obs;
  Rx<String> selectCountry = ''.obs;
  late Timer timer;
  Rx<int> verificationTimer = 59.obs;
  Rx<bool> isLoading = false.obs;

  Random random = new Random();
  build() async {
    await getDataCountry();
  }

  getDataCountry() async {
    listCountry.clear();

    final country =
        await rootBundle.loadString('assets/json/dial_country.json');
    final countryDecode = jsonDecode(country) as List;
    for (var element in countryDecode) {
      listCountry.add(CountryEntity.fromJson(element));
    }
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    final isoCountryCode = systemLocales.first.countryCode;
    final filterCountry = countryDecode
        .where((element) => element['code'] == isoCountryCode)
        .first;
    selectCountry.value = filterCountry['dial_code'];
  }

  sendOtp(context) async {
    isLoading.value = true;
    final sendNoTlpn = validationPhonNumber();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${selectCountry}${sendNoTlpn}',
      verificationCompleted: (PhoneAuthCredential credential) {
        isLoading.value = false;
        startTimer();
        otpService.codeVerificationSaved(credential.smsCode);
        Get.toNamed(routeHelper.toVerificationNumbeCode);
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading.value = false;
        DialogHelper.snackBarHelper(context, message: 'Upss, ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        int random_number = random.nextInt(100);
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: random_number.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  validationSendOtp(context) {
    if (noTlpnController.value.text.isNotEmpty) {
      if (isLoading.isFalse) {
        sendOtp(context);
      }
    } else {
      DialogHelper.snackBarHelper(context,
          message: 'Nomor telepon wajib di isi');
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(oneSec, (Timer timer) {
      if (verificationTimer.value == 0) {
        isLoading.value = false;

        otpService.codeVerificationDeleted();
        timer.cancel();
      } else {
        verificationTimer.value--;
      }
    });
  }

  String validationPhonNumber() {
    String noTlpn = noTlpnController.value.value.text;
    var veriFicationNoTlpn = noTlpn.split('');
    if (veriFicationNoTlpn.first == '0') {
      veriFicationNoTlpn.removeAt(0);
      return veriFicationNoTlpn.join("");
    } else {
      return veriFicationNoTlpn.join("");
    }
  }

  verificationCode(pin, context) async {
    final noTlpn = validationPhonNumber();
    final otp = await otpService.codeVerificationCalled();
    if (verificationTimer.value != 0) {
      if (otp == pin) {
        otpService.sessionSaved("${selectCountry.value}$noTlpn");
        DialogHelper.snackBarHelper(context,
            message: 'Terimakasih , kode sesuai');
        Get.toNamed(routeHelper.initial);
      } else {
        DialogHelper.snackBarHelper(context, message: 'OTP tidak sesuai');
      }
    } else {
      DialogHelper.snackBarHelper(context,
          message:
              'Waktu habis, tekan kirim ulang untuk mendapatkan kode baru');
    }
  }

  Widget nextButtonValidationWidget(Widget? loading, Widget? done) {
    if (isLoading.isTrue) {
      return loading!;
    } else {
      return done!;
    }
  }

  //ONLY ONPRESS /ONCHANGE / ONTAP
  onChangeCountry(value) {
    selectCountry.value = value;
  }

  //END ----> ON
}
