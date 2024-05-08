import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/home_layout/Home_layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Page1.dart';

class DescriptionScreen extends StatefulWidget {
  static const String routeName = 'description';

  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
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
          padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 40),
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
                      child: Center(child: Text(contents[i].text)),
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
                  Navigator.pushReplacementNamed(context, HomeLayout.routeName);
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

