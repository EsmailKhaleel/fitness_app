// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:packages_app/fitness_app/Modules/home_screen.dart';

class OnboardingScreen2 extends StatelessWidget {
  OnboardingScreen2({Key? key}) : super(key: key);
  var pages = [
    PageViewModel(
      title: "Welcome to Fitness Application",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset('assets/images/heartOnboarding.jpg')),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange, fontSize: 30),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        pageColor: Colors.white,
        imageFlex: 2,
      ),
    ),
    PageViewModel(
      title: "Welcome to Fitness Application",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset('assets/images/heartOnboarding.jpg')),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange, fontSize: 30),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        pageColor: Colors.white,
        imageFlex: 2,
      ),
    ),
    PageViewModel(
      title: "Welcome to Fitness Application",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset('assets/images/heartOnboarding.jpg')),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange, fontSize: 30),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        pageColor: Colors.white,
        imageFlex: 2,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        onSkip: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        showBackButton: false,
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.arrow_forward_ios_outlined),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.orangeAccent,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
