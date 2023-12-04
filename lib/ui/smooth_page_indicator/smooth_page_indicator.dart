import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/register/RegisterScreen.dart';
import 'package:missing_finder1/ui/smooth_page_indicator/Page1.dart';
import 'package:missing_finder1/ui/smooth_page_indicator/Page2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPage extends StatelessWidget {
  static const String routeName = 'smooth';

  SmoothPage({super.key});

  final _controller = PageController();
  List<Widget> pageView = [
    Page1(),
    Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 45, left: 20, right: 20, bottom: 20),
              child: Container(
                height: 710.h,
                width: 333.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: theme.colorScheme.onPrimary,
                ),
                child: PageView(
                  controller: _controller,
                  children: [
                    Page1(),
                    Page2(),
                  ],
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 550, left: 150),
              child: TextButton(
                  onPressed: () {
                    _controller.animateToPage(1,
                        duration: Duration(seconds: 1), curve: Curves.linear);
                  },
                  child: Text(
                    "countine....",
                    style: theme.textTheme.bodyMedium,
                  )),
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
    );
  }
}
