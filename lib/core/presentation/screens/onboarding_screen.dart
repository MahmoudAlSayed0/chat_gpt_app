// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:chat_gpt_app/app/router.dart';
import 'package:chat_gpt_app/core/data/models/onboarding_model.dart';
import 'package:chat_gpt_app/utils/app_icons.dart';
import 'package:chat_gpt_app/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/page_view_element.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  bool doneOnboarding = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            80.verticalSpace,
            SvgPicture.asset(
              AppIcons.logoDark,
              color: Theme.of(context).colorScheme.primary,
              width: 24.sp,
              height: 24.sp,
            ),
            24.verticalSpace,
            SizedBox(
              width: 200.w,
              child: Text(
                'Welcome to ChatGPT',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            24.verticalSpace,
            Text(
              'Ask anything, get yout answer',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            46.verticalSpace,
            Flexible(
              child: PageView(
                controller: _controller,
                children: [
                  PageViewElement(
                    data: OnboardingData(
                      icon: AppIcons.sun,
                      title: 'Examples',
                      info: [
                        '“Explain quantum computing in simple terms”',
                        '“Got any creative ideas for a 10 year old’s birthday?”',
                        '“How do I make an HTTP request in Javascript?”'
                      ],
                    ),
                  ),
                  PageViewElement(
                    data: OnboardingData(
                      icon: AppIcons.thunder,
                      title: 'Capabilities',
                      info: [
                        'Remembers what user said earlier in the conversation',
                        'Allows user to provide follow-up corrections',
                        'Trained to decline inappropriate requests'
                      ],
                    ),
                  ),
                  PageViewElement(
                    data: OnboardingData(
                      icon: AppIcons.alert,
                      title: 'Limitations',
                      info: [
                        'May occasionally generate incorrect information',
                        'May occasionally produce harmful instructions or biased content',
                        'Limited knowledge of world and events after 2021'
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ColorTransitionEffect(
                activeStrokeWidth: 2.h,
                activeDotColor: AppColors.primary,
                dotColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
                dotWidth: 28.w,
                dotHeight: 2.h,
                spacing: 16.w,
              ),
            ),
            20.verticalSpace,
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Theme.of(context).primaryColor),

                minimumSize: MaterialStateProperty.all(Size(335.w, 48.h)),
                // Set the padding
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h)),
                // Set the gap between the button's child and its border
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
              onPressed: doneOnboarding
                  ? () {
                      log('message');
                      RouteManager.replace(RouteManager.home);
                    }
                  : () async {
                      if (_controller.page! >= 1) {
                        doneOnboarding = true;
                      }
                      await _controller.nextPage(
                          duration: Durations.long3, curve: Curves.easeInOut);
                      setState(() {});
                    },
              child: Text(
                !doneOnboarding ? 'Next' : 'Let\'s Chat',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            20.verticalSpace,
            /*  TextButton(
              child: const Text('text'),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ), */
          ],
        ),
      ),
    );
  }
}
