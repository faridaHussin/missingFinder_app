import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/searchTab/ResultScreen.dart';
import 'package:missing_finder1/ui/widgets/ButtonWidget.dart';

class ResponseFoundMatchSearch extends StatelessWidget {
  static const String routeName = 're-search';

  const ResponseFoundMatchSearch({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text('We Found a matching',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(
                height: 7,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ResultScreen.routeName);
                  },
                  child: ButtonWidget(text: 'Show The Result')),
            ],
          ),
        ),
      ),
    );
  }
}
