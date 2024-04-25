// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:chat_gpt_app/app/router.dart';
import 'package:chat_gpt_app/utils/app_icons.dart';
import 'package:chat_gpt_app/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        60.verticalSpace,
        const ChatScreenHeader(),
        Expanded(
          child: ListView(
            children: const [
              ChatMessageWidget(
                isUser: true,
                message:
                    'ssaasdgasdgasgdasgsagagadafgdgdasgasgasgagagagagagagadsfasdfadsfdasfsdafasdfasdfasdfasdfasdfdasga',
              ),
              ChatMessageWidget(
                isUser: false,
                message:
                    'ssaasdgasdgasgdasgsagagadafgdgdasgasgasgagagagagagagadsfasdfadsfdasfsdafasdfasdfasdfasdfasdfdasga',
              ),
              ChatMessageWidget(
                isUser: true,
                message:
                    'ssaasdgasdgasgdasgsagagadafgdgdasgasgasgagagagagagagadsfasdfadsfdasfsdafasdfasdfasdfasdfasdfdasga',
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.r),
              suffixIcon: InkWell(
                onTap: () {
                  log('send');
                },
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: SvgPicture.asset(AppIcons.send),
                ),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
              /*  enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  // color: Colors.teal, // Border color
                  width: 2.0, // Border width
                ),
              ), */
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8.r),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8.r),
                // Border radius
              ),
            ),
          ),
        ),
        40.verticalSpace
      ],
    ));
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    super.key,
    required this.isUser,
    required this.message,
  });
  final bool isUser;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 267.w),
        margin: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 20.w,
        ),
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.primary
              : Theme.of(context).colorScheme.primary.withOpacity(.1),
          borderRadius: isUser
              ? BorderRadius.circular(8.r).copyWith(
                  bottomRight: const Radius.circular(0),
                )
              : BorderRadius.circular(8.r).copyWith(
                  bottomLeft: const Radius.circular(0),
                ),
        ),
        child: Text(
          message,
        ),
      ),
    );
  }
}

class ChatScreenHeader extends StatelessWidget {
  const ChatScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.primary.withOpacity(.4),
            width: 2.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              RouteManager.pop();
            },
            child: Row(
              children: <Widget>[
                Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    AppIcons.rightArrow,
                    width: 12.sp,
                    height: 12.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                16.horizontalSpace,
                Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SvgPicture.asset(
            AppIcons.logoDark,
            width: 24.sp,
            height: 24.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
