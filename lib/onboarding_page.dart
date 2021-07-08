import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboarding.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _controller.onboarding[index].imageAsset,
                          height: 300,
                          width: 300,
                        ),
                        SizedBox(height: 32),
                        Text(
                          _controller.onboarding[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            _controller.onboarding[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 36,
              left: 36,
              child: Row(
                children: List.generate(
                  _controller.onboarding.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                backgroundColor: Colors.red[500],
                elevation: 0,
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Start' : 'Next');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
