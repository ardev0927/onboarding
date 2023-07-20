import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onboarding/configs/colors.dart';
import 'package:onboarding/models/onboard.dart';
import 'package:onboarding/widgets/dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? _pageController;
  Timer? _timer;
  int _pageIndex = 0;
  // int _pageCount = 3;

  final List<Onboard> _pages = [
    Onboard(
        image: 'assets/images/intro_1.png',
        title: 'Genuine product',
        description:
            'Diversified items of products in life, genuine product, safe'),
    Onboard(
        image: 'assets/images/intro_2.png',
        title: 'Convenient ordering',
        description:
            'Order multiple items from multiple brands at the same time'),
    Onboard(
        image: 'assets/images/intro_3.png',
        title: 'Easy search',
        description:
            'Find products easy with Scanning camera, pay with just one camera scan'),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController?.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _timer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
              itemBuilder: (context, index) {
                var onboard = _pages[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(onboard.image!),
                    Text(
                      onboard.title!,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: Text(
                        onboard.description!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: text20Color,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  _pages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Join now',
                      style: TextStyle(color: appColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBgColor,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Log In',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
