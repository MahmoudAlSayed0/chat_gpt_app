import 'dart:developer';

import 'package:chat_gpt_app/core/presentation/cubit/theme_cubit.dart';
import 'package:chat_gpt_app/utils/app_icons.dart';
import 'package:chat_gpt_app/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<ThemeCubit>().state is LightTheme
          ? AppColors.white
          : AppColors.black,
      body: Column(
        children: <Widget>[
          60.verticalSpace,
          const NewChatButton(),
          Expanded(
            child: Container(),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(.4), // Specify the color of the border
                  width: 2.0, // Specify the width of the border
                ),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    log('delete');
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 4.h,
                  ),
                  leading: SvgPicture.asset(
                    AppIcons.bin,
                    width: 20.sp,
                    height: 20.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    'Clear Conversations',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    log('upgrade');
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 4.h,
                  ),
                  leading: SvgPicture.asset(
                    AppIcons.person,
                    width: 20.sp,
                    height: 20.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    'Upgrade to Plus',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.5.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.lightGold,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Text(
                      'New',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    log('Change theme');
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 4.h,
                  ),
                  leading: SvgPicture.asset(
                    AppIcons.sun,
                    width: 20.sp,
                    height: 20.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    context.read<ThemeCubit>().state is LightTheme
                        ? 'Dark mode'
                        : 'Light mode',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    log('FAQ');
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 4.h,
                  ),
                  leading: SvgPicture.asset(
                    AppIcons.faq,
                    width: 20.sp,
                    height: 20.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    'Updates & FAQ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    log('Logout');
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 4.h,
                  ),
                  leading: SvgPicture.asset(
                    AppIcons.logout,
                    width: 20.sp,
                    height: 20.sp,
                    color: AppColors.red,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NewChatButton extends StatelessWidget {
  const NewChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('new');
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(.4), // Specify the color of the border
              width: 2.0, // Specify the width of the border
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  AppIcons.message,
                  width: 20.sp,
                  height: 20.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                16.horizontalSpace,
                Text(
                  'New Chat',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SvgPicture.asset(
              AppIcons.rightArrow,
              width: 12.sp,
              height: 12.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
