import 'package:bookly_app/core/utils/assets.dart';
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
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => SlideTransition(
                 position:_animation ,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Read for books',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'montserrat',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
