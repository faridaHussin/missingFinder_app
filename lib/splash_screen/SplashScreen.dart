import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/home_layout/Home_Screen.dart';
import 'package:missing_finder1/ui/home/Report/ReportScreen.dart';
import 'package:missing_finder1/ui/register/RegisterScreen.dart';

import '../ui/home/home_layout/Home_layout.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

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
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 16.h),
        child: Column(
          children: [
            Expanded(child: Image.asset('assets/images/logo.png')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HomeLayout.routeName);
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
