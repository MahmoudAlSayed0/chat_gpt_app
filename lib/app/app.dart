import 'package:chat_gpt_app/app/router.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      //Routing stuff
      navigatorKey: RouteManager.navigatorKey,
      onGenerateRoute: RouteManager.onGenerateGlobalRoute,
      initialRoute: RouteManager.home,
      routes: RouteManager.globalRoutes,
    );
  }
}
