import 'package:shared_preferences/shared_preferences.dart';

class OtpService {
  Future<SharedPreferences> initial() async {
    final sharePreferen = await SharedPreferences.getInstance();

    return sharePreferen;
  }

  codeVerificationSaved(otp) async {
    final sharePreferen = await initial();
    await sharePreferen.setString('otp', otp);
  }

  codeVerificationCalled(otp) async {
    final sharePreferen = await initial();
    await sharePreferen.getString('otp');
  }
}
