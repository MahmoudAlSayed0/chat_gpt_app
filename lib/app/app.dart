import 'package:chat_gpt_app/app/router.dart';
import 'package:chat_gpt_app/core/presentation/cubit/chat/chat_cubit.dart';
import 'package:chat_gpt_app/core/presentation/cubit/theme/theme_cubit.dart';
import 'package:chat_gpt_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final ThemeState initialTheme =
        brightness == Brightness.dark ? DarkTheme() : LightTheme();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(initialTheme),
        ),
        BlocProvider<ChatCubit>(
          create: (BuildContext context) => ChatCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  state is DarkTheme ? Brightness.light : Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness:
                  state is DarkTheme ? Brightness.light : Brightness.dark,
            ),
          );
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: state is LightTheme ? ThemeMode.light : ThemeMode.dark,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              navigatorKey: RouteManager.navigatorKey,
              onGenerateRoute: RouteManager.onGenerateGlobalRoute,
              initialRoute: RouteManager.onboarding,
              routes: RouteManager.globalRoutes,
            ),
          );
        },
      ),
    );
  }
}
