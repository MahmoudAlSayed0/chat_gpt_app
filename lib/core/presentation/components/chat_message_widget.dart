// ignore_for_file: deprecated_member_use

import 'package:chat_gpt_app/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isUser
                ? AppColors.white
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
