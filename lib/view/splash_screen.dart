import 'package:flutter/material.dart';
import 'package:userauthapi/res/colors/app_color.dart';
import 'package:userauthapi/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.splashColor,
      body: Center(
          child: Text(
        'Welcome',
        style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 50,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      )),
    );
  }
}
