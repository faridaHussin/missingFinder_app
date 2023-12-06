import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/data/di.dart';
import 'package:missing_finder1/ui/register/RegisterScreenWithEmail.dart';
import 'package:missing_finder1/ui/register/cubit/RegisterScreenViewModel.dart';
import 'package:missing_finder1/ui/register/cubit/Register_States.dart';

import '../../utils/TextFieldItem.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  DateTime dateTime = DateTime(2023, 2, 1, 10, 20);
  int genderIndex = -1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {},
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 20),
                child: Text('Create\nnew account',
                    style: theme.textTheme.titleLarge),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Already A Member?',
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Log In',
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Form(
                    key: viewModel.forKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldItem(
                                  hintText: 'First Name',
                                  controller: viewModel.firstName,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your first name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: TextFieldItem(
                                  hintText: 'Last Name',
                                  controller: viewModel.lastName,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your last name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                Text(
                                  'Gender',
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        genderIndex = 0;
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 9,
                                        ),
                                        width: 102.w,
                                        height: 39.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          color: genderIndex == 0
                                              ? Color(0xFF0D1516)
                                              : Color(0xFFE8D6D6)
                                                  .withOpacity(0.5),
                                        ),
                                        child: Text("Male",
                                            style: theme.textTheme.bodyMedium,
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        genderIndex = 1;
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 9,
                                        ),
                                        width: 102.w,
                                        height: 39.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          color: genderIndex == 1
                                              ? Color(0xFF0D1516)
                                              : Color(0xFFE8D6D6)
                                                  .withOpacity(0.5),
                                        ),
                                        child: Text('Female',
                                            style: theme.textTheme.bodyMedium,
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Date of birth ',
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SizedBox(
                                        height: 250,
                                        width: double.infinity,
                                        child: CupertinoDatePicker(
                                          backgroundColor: Colors.white,
                                          initialDateTime: dateTime,
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged:
                                              (DateTime newTime) {
                                            setState(() {
                                              dateTime = newTime;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                      ),
                                      width: 68.w,
                                      height: 32.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        color:
                                            Color(0xFFE8D6D6).withOpacity(0.5),
                                      ),
                                      child: Text('${dateTime.day}',
                                          style: theme.textTheme.bodyMedium,
                                          textAlign: TextAlign.center)),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                  ),
                                  width: 68.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Color(0xFFE8D6D6).withOpacity(0.5),
                                  ),
                                  child: Text('${dateTime.month}',
                                      style: theme.textTheme.bodyMedium,
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                  ),
                                  width: 81.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Color(0xFFE8D6D6).withOpacity(0.5),
                                  ),
                                  child: Text('${dateTime.year}',
                                      style: theme.textTheme.bodyMedium,
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterScreenWithEmail.routeName);
                              },
                              child: Text('COUNTINE',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(224, 48),
                                backgroundColor:
                                    Color(0xFFE8D6D6).withOpacity(0.5),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
