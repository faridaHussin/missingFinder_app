import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../register/RegisterScreen.dart';
import 'Page1.dart';

class OnBoarging extends StatefulWidget {
  static const String routeName = 'onboarding';

  const OnBoarging({super.key});

  @override
  State<OnBoarging> createState() => _OnBoargingState();
}

class _OnBoargingState extends State<OnBoarging> {
  int currentIndex = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 40),
          child: Stack(
            children: [
              PageView.builder(
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Container(
                      width: 333.w,
                      height: 710,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Color(0xFF987B71).withOpacity(0.5),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.5)),
                      ),
                      child: Center(child: Text('')),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 660),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: SwapEffect(
                      type: SwapType.yRotation,
                      activeDotColor: Colors.black,
                      dotColor: Colors.white,
                      spacing: 17,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 780, left: 330),
                  child: Text(
                    "Skip",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

