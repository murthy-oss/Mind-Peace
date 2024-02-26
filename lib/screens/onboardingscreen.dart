// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmr_test_app/screens/signup.dart';
import 'package:onboarding/onboarding.dart';
//import 'package:flutter_splash_screen/flutter_splash_screen.dart';

void main() {
  runApp(const onBoardingPage());
}

class onBoardingPage extends StatefulWidget {
  const onBoardingPage({Key? key}) : super(key: key);

  @override
  State<onBoardingPage> createState() => _onBoardingPageState();
}

class _onBoardingPageState extends State<onBoardingPage> {
 
  

  ///hide your splash screen
 
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.w,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Image.asset('assets/images/onboaring1.jpg',
                  ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome to mind peace . We are glad you chose us as your confidental mental Health sevice provider.Together let us navigate this complex,yet intersting journey called life....,',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.w,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Image.asset('assets/images/onboarding3.jpg',
                 ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 20.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Counselling, Psychotherapy, Executive Coaching, Nutritional Coaching and More (Face to Face, Video, Audio)',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Give others access to any file or folders you choose',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.w,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Image.asset('assets/images/pexels-tima-miroshnichenko-5407206.jpg',
                 ),
               
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 10.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Counselling, Psychotherapy, Executive Coaching, Nutritional Coaching and More (Face to Face, Video, Audio)',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
   // hideScreen();
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.push(context,
           MaterialPageRoute(builder: (context)=>const AuthenticationScreen()));
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Get Start',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.w,
                  color: background,
                ),
              ),
              child: ColoredBox(
                color: background,
                child: Padding(
                  padding:  EdgeInsets.all(45.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}