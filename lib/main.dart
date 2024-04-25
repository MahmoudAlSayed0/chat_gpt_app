import 'package:chat_gpt_app/app/app.dart';
import 'package:chat_gpt_app/core/data/datasource/local_data_source/hiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await LocalDataSource.init();

  await Future.delayed(
    const Duration(seconds: 3),
    () {
      FlutterNativeSplash.remove();
    },
  );
  runApp(const MainApp());
}
