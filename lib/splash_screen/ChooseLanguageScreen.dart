import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/splash_screen/smooth_page_indicator/smooth_page_indicator.dart';

class ChooseLanguageScreen extends StatelessWidget {
  static const String routeName = 'language';

  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/logo.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, DescriptionScreen.routeName);
                    },
                    child: Container(
                      width: 102.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Color(0xFFE8D6D6).withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          'English ',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, DescriptionScreen.routeName);
                    },
                    child: Container(
                      width: 102.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Color(0xFFE8D6D6).withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          'العربية',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
