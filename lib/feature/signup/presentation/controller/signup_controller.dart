import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_muhammad_riski/core/service/local/otp_service.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/domain/entity/country_entity.dart';
import 'package:get/get.dart';
import 'dart:math';

class SignupController extends GetxController {
  final otpService = OtpService();
  RxList<CountryEntity> listCountry = <CountryEntity>[].obs;
  Rx<TextEditingController> noTlpnController =
      TextEditingController(text: '').obs;
  Rx<String> selectCountry = ''.obs;
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

  sendOtp() async {
    String noTlpn = noTlpnController.value.value.text;
    var veriFicationNoTlpn = noTlpn.split('');
    var sendToNoTlpn = '';
    if (veriFicationNoTlpn.first == '0') {
      veriFicationNoTlpn.removeAt(0);
      sendToNoTlpn = veriFicationNoTlpn.join("");
    } else {
      sendToNoTlpn = veriFicationNoTlpn.join("");
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${selectCountry}${sendToNoTlpn}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        int random_number = random.nextInt(2);
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: random_number.toString());
        otpService.codeVerificationSaved(random_number.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //ONLY ONPRESS /ONCHANGE / ONTAP
  onChangeCountry(value) {
    selectCountry.value = value;
  }

  //END ----> ON
}
