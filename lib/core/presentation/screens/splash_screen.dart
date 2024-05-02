import 'package:chat_gpt_app/app/router.dart';
import 'package:chat_gpt_app/core/presentation/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        RouteManager.replaceUntilOrAll(RouteManager.home);
      },
    );
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 170.h,
            child: context.read<ThemeCubit>().state is LightTheme
                ? Image.asset('assets/images/gpt_logo_light.png')
                : Image.asset('assets/images/gpt_logo_dark.png')),
      ),
    );
  }
}
