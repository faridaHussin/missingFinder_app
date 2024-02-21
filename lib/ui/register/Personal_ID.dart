import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/data/di.dart';

import 'package:missing_finder1/ui/register/picker_file.dart';

import 'cubit/RegisterScreenViewModel.dart';

class PersonalID extends StatefulWidget {
  static const String routeName = 'password';

  PersonalID({super.key});

  @override
  State<PersonalID> createState() => _PersonalIDState();
}

class _PersonalIDState extends State<PersonalID> {
  RegisterScreenViewModel viewModel = RegisterScreenViewModel(
      registerUseCase: injectRegisterUseCase());
  File?personalIdCard;

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
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: ElevatedButton(
                onPressed: () {
                  ShowGalleryBottomSheet(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, color: Colors.black, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Upload ID card",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(364, 57),
                  backgroundColor: Color(0xFFFCFCFC).withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Container(
              child: CircleAvatar(
                backgroundImage:
                    personalIdCard == null ? null : FileImage(personalIdCard!),
              ),
            ),
            SizedBox(
              height: 250.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 80,
                right: 80,
                bottom: 25,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(
                  //     context);
                },
                child: Text('COUNTINE',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(203, 44),
                  backgroundColor: Color(0xFFFCFCFC).withOpacity(0.5),
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

  void ShowGalleryBottomSheet(context) {
    showModalBottomSheet(context: context, builder: (context) =>
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.r)
            ),
            color: Color(0xFFB7935F).withOpacity(0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                  Text(
                    'Gallery',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () async {
                        File? temp = await ImageFunctions.galleryPicker();
                        if (temp != null) {
                          temp = personalIdCard;
                        }
                        setState(() {});
                      },
                      icon: Icon(Icons.arrow_drop_down)),
                  SizedBox(
                    width: 245.w,
                  ),
                  IconButton(
                    onPressed: () async {
                      File? temp = await ImageFunctions.cameraPicker();
                      if (temp != null) {
                        temp = personalIdCard;
                      }
                      setState(() {});
                    },
                    icon: Icon(Icons.camera_alt_outlined),
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
