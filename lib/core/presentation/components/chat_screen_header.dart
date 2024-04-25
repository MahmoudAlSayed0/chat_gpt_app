// ignore_for_file: deprecated_member_use

import 'package:chat_gpt_app/app/router.dart';
import 'package:chat_gpt_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
