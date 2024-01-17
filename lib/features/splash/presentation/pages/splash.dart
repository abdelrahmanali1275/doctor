import 'dart:async';
import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/helper/functions/common.dart';
import 'package:esteshary_doctor/core/utils/app_consts.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/login/presentation/pages/login_screen.dart';

import '../../../../core/helper/save_data.dart';
import '../../../home/presentation/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    setLightStatusBar();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (CacheHelper.isLogin()) {
        Login().launch(context, isNewTask: true);
      } else {
        HomeScreen().launch(context, isNewTask: true);
      }
      timer.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppConsts.appHeight = MediaQuery.of(context).size.height;
    AppConsts.appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        builder: (context, double value, child) => Transform.scale(
            scale: value,
            child:
                Opacity(opacity: value, child: Image.asset(AppAssets.splach))),
      )),
    );
  }
}
