import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/splash_screen/ChooseLanguageScreen.dart';
import 'package:missing_finder1/splash_screen/SplashScreen.dart';
import 'package:missing_finder1/splash_screen/smooth_page_indicator/smooth_page_indicator.dart';
import 'package:missing_finder1/ui/home/Report/ReportScreen.dart';
import 'package:missing_finder1/ui/home/Report/ReportScreenPart2.dart';
import 'package:missing_finder1/ui/home/home_layout/ChangePasswordScreen.dart';
import 'package:missing_finder1/ui/home/home_layout/DeleteAccountScreen.dart';
import 'package:missing_finder1/ui/home/home_layout/DeleteAccountScreen2.dart';
import 'package:missing_finder1/ui/home/home_layout/Home_Screen.dart';
import 'package:missing_finder1/ui/home/home_layout/Home_layout.dart';
import 'package:missing_finder1/ui/home/listOfMissigPersons/ListOfMissing.dart';
import 'package:missing_finder1/ui/home/report/ResponseReportScreen.dart';
import 'package:missing_finder1/ui/home/searchTab/ResponseFoundMatchSearch.dart';
import 'package:missing_finder1/ui/home/searchTab/ResponseSearchScreen.dart';
import 'package:missing_finder1/ui/home/searchTab/ResultDetails.dart';
import 'package:missing_finder1/ui/home/searchTab/ResultScreen.dart';
import 'package:missing_finder1/ui/home/searchTab/SearchScreen.dart';
import 'package:missing_finder1/ui/home/volunteer/VolunteerScreen.dart';
import 'package:missing_finder1/ui/home/volunteer/VolunteerScreenPart2.dart';
import 'package:missing_finder1/ui/register/Personal_ID.dart';
import 'package:missing_finder1/ui/register/RegisterScreen.dart';
import 'package:missing_finder1/ui/register/activate_account/ActivateAccount.dart';
import 'package:missing_finder1/ui/register/reconfirmAccount/ReconfirmAccount.dart';
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
            ChooseLanguageScreen.routeName: (context) => ChooseLanguageScreen(),
            ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
            DeleteAccountScreen.routeName: (context) => DeleteAccountScreen(),
            DeleteAccountScreen2.routeName: (context) => DeleteAccountScreen2(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            DescriptionScreen.routeName: (context) => DescriptionScreen(),
            PersonalID.routeName: (context) => PersonalID(),
            ActivateAccount.routeName: (context) => ActivateAccount(),
            ReconfirmAccount.routeName: (context) => ReconfirmAccount(),
            HomeLayout.routeName: (context) => HomeLayout(),
            HomeScreen.routeName: (context) => HomeScreen(),
            ReportScreen.routeName: (context) => ReportScreen(),
            ReportScreenPart2.routeName: (context) => ReportScreenPart2(),
            VolunteerScreen.routeName: (context) => VolunteerScreen(),
            VolunteerScreenPart2.routeName: (context) => VolunteerScreenPart2(),
            ListOfMissing.routeName: (context) => ListOfMissing(),
            SearchScreen.routeName: (context) => SearchScreen(),
            ResponseReportScreen.routeName: (context) => ResponseReportScreen(),
            ResponseSearchScreen.routeName: (context) => ResponseSearchScreen(),
            ResponseFoundMatchSearch.routeName: (context) =>
                ResponseFoundMatchSearch(),
            ResultScreen.routeName: (context) => ResultScreen(),
            ResultDetails.routeName: (context) => ResultDetails(),
          },
        );
      },
    );
  }
}
