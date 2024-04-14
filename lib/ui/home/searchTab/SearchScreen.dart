import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/searchTab/ResponseFoundMatchSearch.dart';

import '../../register/picker_file.dart';
import '../widgets/ButtonWidget.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: pickedImage == null
                      ? null
                      : DecorationImage(
                          image: FileImage(pickedImage!),
                        ),
                ),
                height: 180,
                width: 180,
                child: pickedImage == null
                    ? Image.asset('assets/images/icon_img.png')
                    : null,
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  dialog();
                },
                child: ButtonWidget(
                  text: 'Upload image',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, ResponseFoundMatchSearch.routeName);
                },
                child: ButtonWidget(
                  text: 'Search',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dialog() {
    showDialog(
        builder: (context) => AlertDialog(
              backgroundColor: Color(0xFFB08963),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            File? temp = await ImageFunctions.cameraPicker();
                            if (temp != null) {
                              pickedImage = temp;
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Camera',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            File? temp = await ImageFunctions.galleryPicker();
                            if (temp != null) {
                              pickedImage = temp;
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.image_outlined,
                            size: 40,
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Gallery',
                      ),
                    ],
                  ),
                ],
              ),
            ),
        context: context);
  }
}
