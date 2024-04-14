import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFA81A1A),
          borderRadius: BorderRadius.circular(25.r),
        ),
        height: 35.h,
        width: 180.w,
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
