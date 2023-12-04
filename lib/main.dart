import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/splash_screen/SplashScreen.dart';
import 'package:missing_finder1/ui/register/EmailMessage.dart';
import 'package:missing_finder1/ui/register/Password_ID.dart';
import 'package:missing_finder1/ui/register/RegisterScreen.dart';
import 'package:missing_finder1/ui/register/TextMessage.dart';
import 'package:missing_finder1/ui/register/picker_file.dart';
import 'package:missing_finder1/ui/smooth_page_indicator/smooth_page_indicator.dart';
import 'package:missing_finder1/utils/Application_Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: Application_Theme.lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            SmoothPage.routeName: (context) => SmoothPage(),
            PasswordID.routeName: (context) => PasswordID(),
            TextMessage.routeName: (context) => TextMessage(),
            PickerFilePage.routeName: (context) => PickerFilePage(),
            EmailMessage.routeName: (context) => EmailMessage(),
          },
        );
      },
    );
  }
}
