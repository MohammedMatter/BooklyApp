import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/splash/presentation/widget/sliding_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required Animation<Offset> animation,
    required this.height,
    required this.width,
  }) : _animation = animation;

  final Animation <Offset>_animation;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Image.asset(AssestData.logo, fit: BoxFit.fill),
        ),
        SizedBox(height: height * 0.01),
        SlidingText(animation: _animation),
      ],
    );
  }
}

