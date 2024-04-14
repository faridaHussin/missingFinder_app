import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponseReportScreen extends StatelessWidget {
  static const String routeName = 'response_report';

  const ResponseReportScreen({super.key});

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
              Icon(Icons.check_circle_outline_outlined,
                  size: 50, color: Colors.black),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'We confirmed your submit',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                  'Please wait we are trying to find a match for your\n data The process may take some time .........',
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600)),
              Text('thank you for choosing missing finder',
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
