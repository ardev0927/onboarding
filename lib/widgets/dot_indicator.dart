import 'package:flutter/material.dart';
import 'package:onboarding/configs/colors.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: isActive ? 24 : 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isActive ? appColor : text20Color.withOpacity(0.2),
      ),
    );
  }
}
