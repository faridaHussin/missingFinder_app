import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DeleteAccountScreen2 extends StatefulWidget {
  static const String routeName = 'Delete';

  const DeleteAccountScreen2({super.key});

  @override
  State<DeleteAccountScreen2> createState() => _DeleteAccountScreen2State();
}

class _DeleteAccountScreen2State extends State<DeleteAccountScreen2> {
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text("Do you want to delete your account",
                    style: theme.textTheme.bodyLarge),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text("Please enter the code that was sent to your email",
                    style: theme.textTheme.bodyMedium),
              ),
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
                        onChanged: (value) {},
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(20),
                          fieldWidth: 53,
                          fieldHeight: 53,
                          selectedColor: Color(0xFFE8D6D6).withOpacity(0.5),
                          inactiveColor: Color(0xFFE8D6D6).withOpacity(0.5),
                          activeFillColor: Color(0xFFE8D6D6).withOpacity(0.5),
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
                        onPressed: () {},
                        child: Text('Verify Code',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(195, 39),
                          backgroundColor: Color(0xFF634E3A).withOpacity(0.80),
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
                        onPressed: () {},
                        child: Text('Resend Code',
                            style: theme.textTheme.titleSmall!
                                .copyWith(fontSize: 17)),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(195, 39),
                          backgroundColor: Color(0xFFD6CACA).withOpacity(0.60),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color(0xFFD6CACA).withOpacity(0.60)),
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
