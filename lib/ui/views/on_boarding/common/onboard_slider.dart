import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wall_art/core/view_models/onboard_slider_provider.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/on_boarding/common/text_button.dart';
import 'package:wall_art/ui/views/on_boarding/onboarding_1.dart';
import 'package:wall_art/ui/views/on_boarding/onboarding_2.dart';
import 'package:wall_art/ui/views/on_boarding/onboarding_3.dart';
import 'package:wall_art/utils/app_colors.dart';

import 'package:wall_art/utils/button.dart';

class OnBoardSlider extends StatefulWidget {
  const OnBoardSlider({super.key});

  @override
  State<OnBoardSlider> createState() => _OnBoardSliderState();
}

class _OnBoardSliderState extends State<OnBoardSlider> {
  bool hideSkip = false;
  final controllerx = PageController();
  List onBoardList = [OnBoarding1View(), OnBoarding2View(), OnBoarding3View()];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardSliderProvider>(context, listen: false);

    double h = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: SizedBox(
          child: Stack(
            children: [
              Consumer<OnBoardSliderProvider>(builder: (context, value, child) {
                return SizedBox(
                  height: h,
                  child: PageView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollBehavior: const ScrollBehavior(),
                    controller: controllerx,
                    children: [
                      ...List.generate(3, (index) => onBoardList[index]),
                    ],
                    onPageChanged: (value) {
                      provider.setCurrentIndex(value);
                      setState(() {
                        if (value == 2) {
                          hideSkip = true;
                        } else {
                          hideSkip = false;
                        }
                      });
                    },
                  ),
                );
              }),
              hideSkip == true
                  ? SizedBox()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: h * 0.025, top: h * 0.062),
                        child: SizedBox(
                            height: 40,
                            width: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.amber)),
                              child: TexttButton(
                                  googleFonts: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.whiteColor),
                                  text: "Skip",
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        RouteName.homeScreen, (route) => false);
                                  }),
                            )),
                      ),
                    ),
              Consumer<OnBoardSliderProvider>(builder: (context, value, child) {
                return Align(
                  alignment: Alignment(.1, .9),

                  // alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: .5,
                    child: PrimaryButton(
                        buttonColor: Colors.transparent,
                        text: provider.currentIndex == 0
                            ? "Explore"
                            : provider.currentIndex == 1
                                ? "Explore More"
                                : "Let's Start",
                        onPressed: () {
                          if (provider.currentIndex < onBoardList.length - 1) {
                            provider.nextPage();
                            controllerx.animateToPage(provider.currentIndex,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn);
                          } else if (provider.currentIndex == 2) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RouteName.homeScreen, (route) => false);
                          }
                        }),
                  ),
                );
              }),
              Align(
                alignment: const Alignment(.75, .65),
                child: FractionallySizedBox(
                  widthFactor: 0.58,
                  child: SmoothPageIndicator(
                    controller: controllerx,
                    count: 3,
                    effect: CustomizableEffect(
                      dotDecoration: DotDecoration(
                        width: 24,
                        height: 12,
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      activeDotDecoration: DotDecoration(
                        width: 32,
                        height: 12,
                        color: Colors.yellow,
                        rotationAngle: 180,
                        verticalOffset: -10,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
