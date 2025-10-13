import 'dart:async';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/presentation/views/home_page_view.dart';
import 'package:bookly_app/features/splash/presentation/widget/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    initSlideAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SplashViewBody(animation: _animation, height: height, width: width),
    );
  }

  void initSlideAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
    Timer(
      Duration(seconds: 4),
      () => Get.to(
        () =>const HomePage(),
        transition: Transition.fade,
        duration: kTransitionDuration,
      ),
    );
  }
}
