import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../config/routes/routes.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/componants/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({Key? key}) : super(key: key);

  var onBoarding = AppImages.onBoardingImage1;

  //var startLoginOrRegisterScreen = false;
  PageController controller = PageController();
  bool showStartButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50.w,
            ),
            _pageView(context),
            SmoothPageIndicator(
                controller: controller, // PageController
                count: 4,
                effect: const ExpandingDotsEffect(
                    spacing: 8.0,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor:
                        AppColors.primaryColor), // your preferred effect
                onDotClicked: (index) {}),
            SizedBox(
              height: 32.w,
            ),
          ],
        ),
      ),
    );
  }




  Container _pageView(BuildContext context) {
    return Container(
      height: 600.w,
      width: double.infinity,
      child: PageView(
        padEnds: false,
        allowImplicitScrolling: false,
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (page) {},
        children: [
          _itemOne(),
          _itemTow(),
          _itemThree(),
          _loginOrRegisterScreen(context)
        ],
      ),
    );
  }

  Column _itemThree() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 35.w,
          ),
          Image.asset(
            AppImages.onBoardingImage3,
            fit: BoxFit.fill,
          ),
          Text(
            "      Now, start \ncommunicating",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 32.sp,
                color: AppColors.primaryColor),
          ),
          SizedBox(
            height: 20.w,
          ),
          Text(
            "    Let  the conversation start \n  and don't  worry we are here \n             "
            "           for you",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Colors.black),
          ),
        ]);
  }

  Padding _itemTow() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.w,
            ),
            Image.asset(
              AppImages.onBoardingImage2,
              fit: BoxFit.cover,
            ),
            Text(
              "  Take a picture ",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 32.sp,
                  color: AppColors.primaryColor),
            ),
            SizedBox(
              height: 60.w,
            ),
            Text(
              " Whenever I can capture accurate\n   pictures, we can translate them  \n                         "
              "  for you ",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Colors.black),
            ),
          ]),
    );
  }

  Column _itemOne() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.w,
          ),
          Image.asset(
            AppImages.onBoardingImage1,
            fit: BoxFit.fill,
          ),
          Text(
            "  Welcome to sign   \n         Language",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 32.sp,
                color: AppColors.primaryColor),
          ),
          SizedBox(
            height: 20.w,
          ),
          Text(
            " This Application helps you\n Communicate in an easier \n            "
            "            way  ",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Colors.black),
          ),
        ]);
  }
}

 _loginOrRegisterScreen( BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
          child: Padding(
            padding: EdgeInsets.only(top: 60.w),
            child: Text(
              "Sign Language",
              style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500),
            ),
          )),
      Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.w),
            child: Text(
              "Welcome",
              style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w500),
            ),
          )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/image _welcome0.png"),
      ),
      SizedBox(
        height: 16.w,
      ),
      Container(
        //color: Colors.green,
        height: 220.w,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                text: "Login",
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                  //setState(() {});
                },
                backgroundColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                width: 230,
                height: 48,
              ),
              Text(
                "OR",
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              CustomButton(
                text: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, Routes.registerScreen);
                  //setState(() {});
                },
                backgroundColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                width: 230,
                height: 48,
              ),
            ]),
      )
    ],
  );
 }