import 'package:chat_gpt_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(
    const Duration(seconds: 5),
    () {
      FlutterNativeSplash.remove();
    },
  );
  runApp(const MainApp());
}
