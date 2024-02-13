import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/splash_screen/SplashScreen.dart';
import 'package:missing_finder1/ui/home/Home_Screen.dart';
import 'package:missing_finder1/ui/register/EmailMessage.dart';
import 'package:missing_finder1/ui/register/Personal_ID.dart';
import 'package:missing_finder1/ui/register/RegisterScreen.dart';
import 'package:missing_finder1/ui/register/activate_account/TextMessage.dart';
import 'package:missing_finder1/ui/smooth_page_indicator/smooth_page_indicator.dart';
import 'package:missing_finder1/utils/Application_Theme.dart';
import 'package:missing_finder1/utils/shared_preferences_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();
//   var user=SharedPreferencesUtils.getData('token');
//   String route;
//   if(user==null){
//     route=RegisterScreen.routeName;
//   }else{
//     route=HomeScreen.routeName;
//   }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

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
            OnBoarging.routeName: (context) => OnBoarging(),
            PersonalID.routeName: (context) => PersonalID(),
            TextMessage.routeName: (context) => TextMessage(),
            EmailMessage.routeName: (context) => EmailMessage(),
            HomeScreen.routeName: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
