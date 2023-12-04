import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            child: Text(
              'fnjfjmdfvjkrnvrj',
              style: TextStyle(color: Colors.black),
            ),
            color: Color(0xFF987B71).withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
