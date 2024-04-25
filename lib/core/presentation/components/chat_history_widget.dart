// ignore_for_file: deprecated_member_use

import 'package:chat_gpt_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                title,
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
    );
  }
}
