import 'package:get/get.dart';
import '../service/otp_service.dart';

class MainController extends GetxController {
  Rx<bool> sessionReady = false.obs;

  validationPage() async {
    final localSevicer = LocalService();
    final session = await localSevicer.sessionCalled();
    if (session != null) {
      sessionReady.value = true;
    }
  }

  @override
  void onInit() {
    validationPage();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
