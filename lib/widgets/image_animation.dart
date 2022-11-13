import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_lang/constants/app_colors.dart';
import 'package:select_lang/constants/image_constants.dart';
import 'package:select_lang/custom_paint/circle_painter.dart';

class AniamtionWidget extends StatefulWidget {
  const AniamtionWidget({super.key, this.onTap});

  // ignore: inference_failure_on_function_return_type
  final  Function(bool)? onTap;

  @override
  State<AniamtionWidget> createState() => _AniamtionWidgetState();
}

class _AniamtionWidgetState extends State<AniamtionWidget>
    with TickerProviderStateMixin {
  bool isEnglishSelected = true;
  // double _progress = 0.0;
  late Animation<double> animation1;
  late Animation<double> animation2;

  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _engAnimationContoller;
  late AnimationController _nepAnimationController;
  late Animation<double> eFlaganimation;
  late Animation<double> nepFlaganimation;

  @override
  void initState() {
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 500),
    );
    final curvedAnimation = CurvedAnimation(
      parent: _animationController1,
      curve: Curves.easeInOutCubic,
    );
    animation1 =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          });
    animateSecond();
    animateEnglishSelectd();
    animateNepaliSelected();

    super.initState();
  }

  void animateEnglishSelectd() {
    _engAnimationContoller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(milliseconds: 400),
    );

    eFlaganimation =
        Tween<double>(begin: 70, end: 85).animate(_animationController1)
          ..addListener(() {
            setState(() {});
          });
  }

  void animateNepaliSelected() {
    _nepAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(milliseconds: 400),
    );
    nepFlaganimation =
        Tween<double>(begin: 70, end: 85).animate(_animationController2)
          ..addListener(() {
            setState(() {});
          });
  }

  void animateSecond() {
    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 500),
    );
    final curvedAnimation2 = CurvedAnimation(
      parent: _animationController2,
      curve: Curves.easeInOutCubic,
    );
    animation2 =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation2)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _engAnimationContoller.dispose();
    _nepAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 220.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _animationController2
                          .reverse()
                          .then((value) => _animationController1.forward());
                      _nepAnimationController
                          .reverse()
                          .then((value) => _engAnimationContoller.forward());

                      isEnglishSelected = true;
                      widget.onTap!(isEnglishSelected);
                    },
                    child: AnimatedBuilder(
                      animation: _engAnimationContoller,
                      builder: (context, child) => Image.asset(
                        ImageConstants.englishFlag,
                        height: eFlaganimation.value,
                        width: eFlaganimation.value,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(100, 100),
                        foregroundPainter: CirclePainer(
                          animation1.value,
                          AppColors.primaryColor,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 0,
                        child: animation1.isCompleted
                            ? SvgPicture.asset(
                                ImageConstants.tickIcon,
                                height: 20,
                                width: 20,
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'English',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 35.h,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              // color: Colors.red,
              height: 100,
              width: 220.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _animationController1
                          .reverse()
                          .then((value) => _animationController2.forward());
                      _engAnimationContoller
                          .reverse()
                          .then((value) => _nepAnimationController.forward());

                      isEnglishSelected = false;
                      widget.onTap!(isEnglishSelected);
                    },
                    child: AnimatedBuilder(
                      animation: _nepAnimationController,
                      builder: (context, child) => Image.asset(
                        ImageConstants.nepaliFlag,
                        height: nepFlaganimation.value,
                        width: nepFlaganimation.value,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(100, 100),
                        foregroundPainter: CirclePainer(
                          animation2.value,
                          AppColors.primaryColor,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 0,
                        child: animation2.isCompleted
                            ? SvgPicture.asset(
                                ImageConstants.tickIcon,
                                height: 20.h,
                                width: 20.w,
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Nepali',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    );
  }
}
