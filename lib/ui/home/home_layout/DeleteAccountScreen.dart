import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/home_layout/DeleteAccountScreen2.dart';

import '../../../utils/TextFieldItem.dart';

class DeleteAccountScreen extends StatefulWidget {
  static const String routeName = 'Delete Account';

  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Delete Account', style: theme.textTheme.titleLarge),
            SizedBox(
              height: 60.h,
            ),
            TextFieldItem(
              hintText: 'Enter Your Email',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter email address';
                }
                bool emailValid = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value);
                if (!emailValid) {
                  return 'invalid email';
                }
              },
            ),
            TextFieldItem(
              hintText: 'Enter Your Password',
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
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, DeleteAccountScreen2.routeName);
              },
              child: Text('Submit',
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
