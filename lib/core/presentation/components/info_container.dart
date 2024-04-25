import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.info,
  });
  final String info;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      constraints: BoxConstraints(maxWidth: 335.w),
      decoration: BoxDecoration(
        color: Theme.of(context).unselectedWidgetColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      width: 335.w,
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 24.w,
      ),
      child: Text(
        info,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
