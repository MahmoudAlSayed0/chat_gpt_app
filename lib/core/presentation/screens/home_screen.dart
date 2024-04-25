// ignore_for_file: deprecated_member_use

import 'package:chat_gpt_app/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/home_button_list.dart';
import '../components/new_chat_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.white
          : AppColors.black,
      body: Column(
        children: <Widget>[
          60.verticalSpace,
          const NewChatButton(),
          Expanded(
            child: Container(),
          ),
          const HomeButtonList()
        ],
      ),
    );
  }
}
