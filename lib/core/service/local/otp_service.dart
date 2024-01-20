import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  Future<SharedPreferences> initial() async {
    final sharePreferen = await SharedPreferences.getInstance();

    return sharePreferen;
  }

  codeVerificationSaved(otp) async {
    final sharePreferen = await initial();
    await sharePreferen.setString('otp', otp);
  }

  sessionSaved(noTlpn) async {
    final sharePreferen = await initial();
    await sharePreferen.setString('session', noTlpn);
  }

  Future<String?> sessionCalled() async {
    final sharePreferen = await initial();
    final session = await sharePreferen.getString('session');
    return session;
  }

  Future<String?> codeVerificationCalled() async {
    final sharePreferen = await initial();
    final otp = await sharePreferen.getString('otp');
    return otp;
  }

  codeVerificationDeleted() async {
    final sharePreferen = await initial();
    await sharePreferen.remove('otp');
  }
}
