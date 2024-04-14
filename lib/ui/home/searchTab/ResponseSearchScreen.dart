import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/Report/ReportScreen.dart';
import 'package:missing_finder1/ui/home/volunteer/VolunteerScreen.dart';

import '../widgets/ButtonWidget.dart';

class ResponseSearchScreen extends StatelessWidget {
  static const String routeName = 'response_search';

  const ResponseSearchScreen({super.key});

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
            children: [
              Icon(Icons.warning_rounded, size: 50, color: Colors.black),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'We couldn\'t find any match',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text('You can make report', style: theme.textTheme.bodyMedium),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ReportScreen.routeName);
                          },
                          child:
                              ButtonWidget(text: 'Report a missing person'))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, VolunteerScreen.routeName);
                          },
                          child: ButtonWidget(
                              text: 'Someone is missing(volunteer)'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
