import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/data/di.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/dialog_utils.dart';
import '../../home/Home_Screen.dart';
import 'cubit/ActivateScreenViewModel.dart';
import 'cubit/Activate_States.dart';

class ActivateAccount extends StatefulWidget {
  static const String routeName = 'Message';

  ActivateAccount({super.key});

  @override
  State<ActivateAccount> createState() => _ActivateAccountState();
}

class _ActivateAccountState extends State<ActivateAccount> {
  // late ActivateScreenViewModel activateViewModel;
  // late ReconfirmScreenViewModel reconfirmViewModel;
  ActivateScreenViewModel activateViewModel = ActivateScreenViewModel(
      activateAccountUseCase: injectActivateAccountUseCase(),
      reconfirmAccountUseCase: injectReconfirmAccountUseCase());

  // @override
  // void initState() {
  //   activateViewModel = ActivateScreenViewModel(
  //     activateAccountUseCase: injectActivateAccountUseCase(),
  //   );
  //   reconfirmViewModel = ReconfirmScreenViewModel(
  //       reconfirmAccountUseCase: injectReconfirmAccountUseCase());
  // }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    // return MultiBlocProvider(
    //     providers: [
    // BlocProvider<ActivateScreenViewModel>(
    // create: (context) => activateViewModel,
    // ),
    // BlocProvider<ReconfirmScreenViewModel>(
    // create: (context) => reconfirmViewModel,
    // ),
    // ],
    // child:
    return BlocListener<ActivateScreenViewModel, ActivateStates>(
      listener: (context, state) => {
        if (state is ActivateLoadingStates)
          {
            DialogUtils.showLoading(context, state.LoadingMessage ?? "Waiting"),
          }
        else if (state is ActivateErrorStates)
          {
            DialogUtils.hideLoading(context),
                  DialogUtils.showMessage(context, state.ErrorMessage!,
                      title: 'Error', posActionName: 'ok'),
                }
              else
                if (state is ActivateSuccessStates)
                  {
                    DialogUtils.hideLoading(context),
                    DialogUtils.showMessage(
                        context, state.activateAccountEntity.message!,
                        posActionName: 'ok'),
                  },
            Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          },
          bloc: activateViewModel,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Text(
                          "Enter the confirmation\ncode from the text\nmessage ",
                          style: theme.textTheme.bodyLarge),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text("Enter the code in the SMS sent to",
                          style: theme.textTheme.bodyMedium),
                    ),
                    Text('1008321565 (Egypt)',
                        style: theme.textTheme.bodyMedium),
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: PinCodeTextField(
                              keyboardType: TextInputType.number,
                              appContext: context,
                              length: 4,
                              cursorHeight: 25,
                              cursorColor: Colors.black,
                              obscureText: true,
                              onChanged: (value) {
                                activateViewModel.pinCodeTextField;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(20),
                                fieldWidth: 53,
                                fieldHeight: 53,
                                selectedColor:
                                Color(0xFFE8D6D6).withOpacity(0.5),
                                inactiveColor:
                                Color(0xFFE8D6D6).withOpacity(0.5),
                                activeFillColor:
                                Color(0xFFE8D6D6).withOpacity(0.5),
                                activeColor: Color(0xFFE8D6D6).withOpacity(0.5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'this code expires in ',
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                '5 minutes',
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: ElevatedButton(
                              onPressed: () {
                                activateViewModel.activateAccount();
                              },
                              child: Text('Verify Code',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(195, 39),
                                backgroundColor:
                                Color(0xFF634E3A).withOpacity(0.80),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                activateViewModel.reconfirmAccount();
                            // Navigator.pushReplacementNamed(context,ReconfirmAccount.routeName);
                              },
                              child: Text('Resend Code',
                                  style: theme.textTheme.titleSmall!
                                      .copyWith(fontSize: 17)),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(195, 39),
                                backgroundColor:
                                Color(0xFFD6CACA).withOpacity(0.60),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color:
                                      Color(0xFFD6CACA).withOpacity(0.60)),
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
      ),
    );
  }
}
