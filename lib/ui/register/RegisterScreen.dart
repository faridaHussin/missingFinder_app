import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/data/di.dart';
import 'package:missing_finder1/ui/register/activate_account/ActivateAccount.dart';
import 'package:missing_finder1/ui/register/cubit/RegisterScreenViewModel.dart';
import 'package:missing_finder1/ui/register/cubit/Register_States.dart';

import '../../utils/TextFieldItem.dart';
import '../../utils/dialog_utils.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  int ?genderIndex;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingStates) {
          DialogUtils.showLoading(context, state.LoadingMessage ?? "Waiting");
        } else if (state is RegisterErrorStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.Message!,
              title: 'Error', posActionName: 'ok');
        } else if (state is RegisterSuccessStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            state.registerResponseEntity.message!,
            posActionName: 'ok',
          );
        }
        Navigator.pushReplacementNamed(context, ActivateAccount.routeName);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              SingleChildScrollView(
                child: Column(
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
                                      if (value == null ||
                                          value.trim().isEmpty) {
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
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TextFieldItem(
                              hintText: 'Email Address',
                              controller: viewModel.email,
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
                                          setState(() {
                                            viewModel.gender.text="Male";
                                          });
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
                                          child: Text('Male',
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
                                          setState(() {
                                            viewModel.gender.text="Female";
                                          });
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
                                  Expanded(
                                    child: Text(
                                      'Date of birth ',
                                      style: theme.textTheme.titleSmall,
                                    ),
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
                                            initialDateTime: viewModel.dateTime,
                                            mode: CupertinoDatePickerMode.date,
                                            onDateTimeChanged:
                                                (DateTime newTime) {
                                              setState(() {
                                                viewModel.dateTime = newTime;
                                              });
                                            },
                                          ),
                                            ),
                                      );
                                    },
                                    child: Container(
                                        width: 68.w,
                                        height: 32.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(30.r),
                                          color: Color(0xFFE8D6D6)
                                              .withOpacity(0.5),
                                        ),
                                        child: Center(
                                          child: Text('${viewModel.dateTime.day}',
                                              style: theme.textTheme.bodyMedium,
                                              textAlign: TextAlign.center),
                                        )),
                                  ),
                                  Container(
                                    width: 68.w,
                                    height: 32.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      color: Color(0xFFE8D6D6).withOpacity(0.5),
                                    ),
                                    child: Center(
                                      child: Text('${viewModel.dateTime.month}',
                                          style: theme.textTheme.bodyMedium,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    width: 81.w,
                                    height: 32.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      color: Color(0xFFE8D6D6).withOpacity(0.5),
                                    ),
                                    child: Center(
                                      child: Text('${viewModel.dateTime.year}',
                                          style: theme.textTheme.bodyMedium,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 35.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.register();
                                },
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
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
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 50, right: 50),
                            //   child: ElevatedButton(
                            //     onPressed: () {
                            //       Navigator.pushReplacementNamed(context,
                            //           RegisterScreenWithEmail.routeName);
                            //     },
                            //     child: Text('countiue',
                            //         style: TextStyle(
                            //             color: Colors.white, fontSize: 17)),
                            //     style: ElevatedButton.styleFrom(
                            //       fixedSize: Size(224, 48),
                            //       backgroundColor:
                            //           Color(0xFFE8D6D6).withOpacity(0.5),
                            //       shape: RoundedRectangleBorder(
                            //         side: BorderSide(color: theme.primaryColor),
                            //         borderRadius: BorderRadius.circular(25),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
