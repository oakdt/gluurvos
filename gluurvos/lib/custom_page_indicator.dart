import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final Color dotColor;
  final Color activeDotColor;

  const CustomPageIndicator({
    super.key,
    required this.controller,
    required this.count,
    this.dotColor = const Color(0xFFC9C5B1),
    this.activeDotColor = const Color(0xFF787569),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double page = controller.hasClients ? controller.page ?? 0 : 0;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            count,
            (index) => _Dot(
              isActive: (index == page.round()),
              dotColor: dotColor,
              activeDotColor: activeDotColor,
            ),
          ),
        );
      },
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  final Color dotColor;
  final Color activeDotColor;

  const _Dot({
    required this.isActive,
    required this.dotColor,
    required this.activeDotColor,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 300),
      tween: ColorTween(
        begin: isActive ? dotColor : activeDotColor,
        end: isActive ? activeDotColor : dotColor,
      ),
      builder: (context, Color? color, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: isActive ? 16 : 12,
          width: isActive ? 16 : 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        );
      },
    );
  }
}