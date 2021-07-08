import 'package:flutter/cupertino.dart';
import 'package:shop/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

import '../bottom_bar.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboarding.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go home page
      Get.to(BottomBarScreen());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboarding = [
    OnboardingInfo('assets/Image1.png', 'Ordre Your Need',
        'Now you can shop from your mobile easily.'),
    OnboardingInfo('assets/Image2.png', 'Ordre Whatever You Want',
        'Now you can find all what you want.'),
    OnboardingInfo('assets/Image3.png', 'Ordre Whenever You Want',
        'Now you can shop Whenever you want from your mobile.')
  ];
}
