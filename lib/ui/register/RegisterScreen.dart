import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/register/Password_ID.dart';
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
  RegisterScreenViewModel viewModel = RegisterScreenViewModel();
  DateTime dateTime = DateTime(2023, 2, 1, 10, 20);
  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingStates) {
        } else if (state is RegisterErrorStates) {
        } else if (state is RegisterSuccessStates) {}
      },
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
                                    return 'please enter your name';
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
                                    return 'please enter your name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        TextFieldItem(
                          hintText: 'E-mail or mobile number',
                          controller: viewModel.emailOrMobileNumber,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter email or mobile number ';
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
                          hintText: 'password',
                          controller: viewModel.password,
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
                          isObscure: viewModel.isObscure,
                          suffixIcon: InkWell(
                            child: viewModel.isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              if (viewModel.isObscure) {
                                viewModel.isObscure = false;
                              } else {
                                viewModel.isObscure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        TextFieldItem(
                          hintText: 'Confirmation password',
                          controller: viewModel.confirmationPassword,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter rePassword';
                            }
                            if (value != viewModel.password.text) {
                              return "password doesn't match";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          isObscure: viewModel.isObscure,
                          suffixIcon: InkWell(
                            child: viewModel.isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              if (viewModel.isObscure) {
                                viewModel.isObscure = false;
                              } else {
                                viewModel.isObscure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(children: [
                      Text(
                        'Gender',
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      ToggleButtons(
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 9,
                            ),
                            width: 102.w,
                            height: 39.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Color(0xFFE8D6D6).withOpacity(0.5),
                            ),
                            child: Text('Male',
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 9,
                            ),
                            width: 102.w,
                            height: 39.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Color(0xFFE8D6D6).withOpacity(0.5),
                            ),
                            child: Text('Female',
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ]),
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
                              builder: (BuildContext context) => SizedBox(
                                height: 250,
                                width: double.infinity,
                                child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  initialDateTime: dateTime,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (DateTime newTime) {
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
                                borderRadius: BorderRadius.circular(30.r),
                                color: Color(0xFFE8D6D6).withOpacity(0.5),
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
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, PasswordID.routeName);
                      },
                      child: Text('COUNTINE',
                          style: TextStyle(color: Colors.black, fontSize: 17)),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(224, 48),
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
            ],
          ),
        ),
      ),
    );
  }
}
