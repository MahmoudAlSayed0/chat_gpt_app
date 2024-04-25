import 'package:chat_gpt_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ScreenUtil.ensureScreenSize();

  await Future.delayed(
    const Duration(seconds: 3),
    () {
      FlutterNativeSplash.remove();
    },
  );
  runApp(const MainApp());
}
