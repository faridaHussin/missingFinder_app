import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/ButtonWidget.dart';
import '../widgets/ContainerWidget.dart';
import 'ResultDetails.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = 'result_search';

  const ResultScreen({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset('assets/images/img.png',
                  fit: BoxFit.cover, width: 200, height: 250),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(child: ContainerWidget(text: 'Ali Moatz')),
                Expanded(child: ContainerWidget(text: '30 Years old'))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(child: ContainerWidget(text: 'lost 2005-10-10')),
                Expanded(child: ContainerWidget(text: 'cairo'))
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, ResultDetails.routeName);
                },
                child: ButtonWidget(text: 'Show more')),
          ],
        ),
      ),
    );
  }
}
