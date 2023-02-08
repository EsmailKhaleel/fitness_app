// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:packages_app/modules/homePage/homePage_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  bool isLastPage = false;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
              print(isLastPage);
            });
          },
          children: [
            buildPage(
              color: Colors.white,
              imagePath: 'assets/images/heartOnboarding.jpg',
              title: 'Hello',
              subTitle:
                  "Heart disease is the leading cause of death in the United States. The term “heart disease” refers to several types of heart conditions.",
            ),
            buildPage(
              color: Colors.white,
              imagePath: 'assets/images/heartOnboarding.jpg',
              title: 'Hello',
              subTitle: "Welcome to our app",
            ),
            buildPage(
              color: Colors.white,
              imagePath: 'assets/images/heartOnboarding.jpg',
              title: 'Hello',
              subTitle: "Welcome to our app",
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              height: 80.0,
              width: double.infinity,
              color: Colors.blue,
              child: TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('showHome', true);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageScreen(),
                    ),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      pageController.jumpToPage(2);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      onDotClicked: (index) {
                        pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                          spacing: 15.0,
                          dotColor: Colors.grey[350]!,
                          dotWidth: 15,
                          activeDotColor: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required Color color,
    required String imagePath,
    required String title,
    required String subTitle,
  }) =>
      Container(
        color: color,
        child: Column(
          children: [
            Expanded(
              child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                subTitle,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
}
