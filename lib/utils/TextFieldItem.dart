import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  TextEditingController? controller;
  String hintText;
  bool isObscure;
  final Widget? suffixIcon;
  TextInputType? keyboardType;

  TextFieldItem({
    this.validator,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 15.h, bottom: 10.h, left: 20.w, right: 20.w),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE8D6D6)),
                  borderRadius: BorderRadius.circular(28.r),
                ),
                fillColor: Color(0xFFE8D6D6).withOpacity(0.5),
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE8D6D6)),
                    borderRadius: BorderRadius.circular(28.r)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                hintText: hintText,
                hintStyle: theme.textTheme.bodySmall,
                suffixIcon: suffixIcon),
            style: const TextStyle(color: Colors.black),
            validator: validator,
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
