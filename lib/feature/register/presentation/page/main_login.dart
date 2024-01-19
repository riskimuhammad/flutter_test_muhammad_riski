import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/feature/register/presentation/widget/register_body_widget.dart';

import '../../../../core/helper/custom_topbar.dart';

class MainRegister extends StatelessWidget {
  MainRegister({super.key});
  @override
  Widget build(BuildContext context) {
    CutomTopBar topBar = CutomTopBar();
    LoginBody body = LoginBody();

    return Scaffold(
      body: topBar.topBar(
        color: BionicColors.orange,
        child: body.body(context),
      ),
    );
  }
}
