import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/register/TextMessage.dart';
import 'package:missing_finder1/ui/register/picker_file.dart';

import 'cubit/RegisterScreenViewModel.dart';

class PasswordID extends StatefulWidget {
  static const String routeName = 'password';

  PasswordID({super.key});

  @override
  State<PasswordID> createState() => _PasswordIDState();
}

class _PasswordIDState extends State<PasswordID> {
  RegisterScreenViewModel viewModel = RegisterScreenViewModel();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 20),
              child: Text('Create\nnew account',
                  style: theme.textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'In order to successful sign in\nFill in the true information',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(child: PickerFilePage()),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 80,
                right: 80,
                bottom: 25,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, TextMessage.routeName);
                },
                child: Text('COUNTINE',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(203, 44),
                  backgroundColor: Color(0xFFD6CACA).withOpacity(0.80),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
