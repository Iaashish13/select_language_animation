import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:select_lang/constants/app_colors.dart';
import 'package:select_lang/widgets/image_animation.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool _isEnglish = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        // title: Text(
        //   'Select Language',
        //   style: TextStyle(color: Colors.black, fontSize: 20.sp),
        // ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Choose Language',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                'Please kindly choose  the language that \n you refer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            AniamtionWidget(
              onTap: (isEnglish) {
                _isEnglish = isEnglish;
                // isEnglish = isEglish;
                // isTapped = true;
                // setState(() {});
              },
            ),
            // SizedBox(
            //   height: 18.h,
            // ),
            SizedBox(
              height: 90.h,
            ),
            Align(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                height: 55.h,
                width: 0.72.sw,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
