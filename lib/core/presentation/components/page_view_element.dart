// ignore_for_file: deprecated_member_use

import 'package:chat_gpt_app/core/data/onboarding_model.dart';
import 'package:chat_gpt_app/core/presentation/components/info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewElement extends StatelessWidget {
  const PageViewElement({super.key, required this.data});
  final OnboardingData data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            data.icon,
            width: 20.sp,
            height: 20.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
          12.verticalSpace,
          Text(
            data.title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          40.verticalSpace,
          ...data.info.map((e) => InfoContainer(info: e))
        ],
      ),
    );
  }
}
