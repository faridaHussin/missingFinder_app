import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/data/di.dart';
import 'package:missing_finder1/ui/register/RegisterScreenWithNum.dart';

import 'package:missing_finder1/ui/register/cubit/Register_States.dart';

import '../../utils/TextFieldItem.dart';
import '../../utils/dialog_utils.dart';

import 'cubit/RegisterScreenViewModel.dart';

class RegisterScreenWithEmail extends StatefulWidget {
  static const String routeName = 'registerEmail';

  RegisterScreenWithEmail({super.key});

  @override
  State<RegisterScreenWithEmail> createState() =>
      _RegisterScreenWithEmailState();
}

class _RegisterScreenWithEmailState extends State<RegisterScreenWithEmail> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

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
          DialogUtils.showMessage(context, state.ErrorMessage!,
              title: 'Error', posActionName: 'ok');
        } else if (state is RegisterSuccessStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'Register Success',
              title: 'Success', posActionName: 'ok');
        }
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120, right: 130),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Text(
                        'please enter your Email address',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Form(
                      key: viewModel.forKey,
                      child: Column(
                        children: [
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
                          viewModel.register();
                        },
                        child: Text('Sign Up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(224, 48),
                          backgroundColor: Color(0xFFE8D6D6).withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RegisterScreenWithNum.routeName);
                        },
                        child: Text('sign up with Mobile number',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(224, 48),
                          backgroundColor: Color(0xFFE8D6D6).withOpacity(0.5),
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
            ],
          ),
        ),
      ),
    );
  }
}
