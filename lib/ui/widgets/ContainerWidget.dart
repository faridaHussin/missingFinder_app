import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        height: 35.h,
        width: 120.w,
        child: Center(
            child: Text(text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ))),
      ),
    );
  }
}
