import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 380),
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              height: 350.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, OnBoarging.routeName);
                  },
                  child: Text(
                    'about us',
                    style: TextStyle(
                        color: theme.colorScheme.onSecondary, fontSize: 17),
                  ),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 17, color: theme.colorScheme.onSecondary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
