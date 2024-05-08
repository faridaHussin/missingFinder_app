import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/TextFieldItem.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = 'ChangePassword';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isObscure = true;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 20),
              child: Text('Change your password',
                  style: theme.textTheme.titleLarge),
            ),
            SizedBox(
              height: 50.h,
            ),
            TextFieldItem(
              hintText: 'Current password',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter password';
                }
                bool emailValid = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value);
                if (!emailValid) {
                  return 'invalid password';
                }
              },
              keyboardType: TextInputType.visiblePassword,
              isObscure: isObscure,
              suffixIcon: InkWell(
                child: isObscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onTap: () {
                  if (isObscure) {
                    isObscure = false;
                  } else {
                    isObscure = true;
                  }
                  setState(() {});
                },
              ),
            ),
            TextFieldItem(
              hintText: 'New password',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter password';
                }
                bool emailValid = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value);
                if (!emailValid) {
                  return 'invalid password';
                }
              },
              keyboardType: TextInputType.visiblePassword,
              isObscure: isObscure,
              suffixIcon: InkWell(
                child: isObscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onTap: () {
                  if (isObscure) {
                    isObscure = false;
                  } else {
                    isObscure = true;
                  }
                  setState(() {});
                },
              ),
            ),
            TextFieldItem(
              hintText: 'Retype new password',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter password';
                }
                bool emailValid = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value);
                if (!emailValid) {
                  return 'invalid password';
                }
              },
              keyboardType: TextInputType.visiblePassword,
              isObscure: isObscure,
              suffixIcon: InkWell(
                child: isObscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onTap: () {
                  if (isObscure) {
                    isObscure = false;
                  } else {
                    isObscure = true;
                  }
                  setState(() {});
                },
              ),
            ),
            GestureDetector(
                child: Text(
              'Forgotten your password?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            )),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Change Password',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(224, 48),
                backgroundColor: Color(0xFFE8D6D6).withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: theme.primaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
