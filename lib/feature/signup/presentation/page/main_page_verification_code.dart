import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/widget/verification_code_body_widget.dart';

class MainVerificationCode extends StatelessWidget {
  MainVerificationCode({super.key});
  final body = VerificationCodeBodyWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body.body(context),
    );
  }
}
