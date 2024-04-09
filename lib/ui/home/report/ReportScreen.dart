import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:missing_finder1/ui/home/Report/ReportScreenPart2.dart';
import 'package:missing_finder1/ui/register/picker_file.dart';
import '../../../utils/TextFieldItem.dart';
import '../../widgets/ContainerDropdownWidget.dart';

class ReportScreen extends StatefulWidget {
  static const String routeName = 'report';

  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController dateController = TextEditingController();
  var healthStatus;
  var statusMissing;
  var selectedCountry;
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: const Text(
              'Report a Missing person',
              style: TextStyle(
                color: Color(0xFFA81A1A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
            backgroundImage:
                pickedImage == null ? null : FileImage(pickedImage!),
            child: pickedImage == null
                ? const Icon(
                    Icons.insert_photo_outlined,
                    size: 40,
                    color: Colors.black,
                  )
                : null,
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
              onTap: () {
                dialog();
              },
              child: const Text(
                'Upload 3 Images',
                style: TextStyle(
                    color: Color(0xFF4333A9),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )),
          SizedBox(
            height: 10.h,
          ),
          Text('Data about the missing person',
              style: theme.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 7.h,
          ),
          Row(
            children: [
              Expanded(
                child: TextFieldItem(
                  hintText: 'Full Name',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter full name';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: TextFieldItem(
                  hintText: 'Age',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter Age';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          TextFieldItem(
            suffixIcon: IconButton(
              onPressed: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2024).add(Duration(days: 365)),
                );
                final formattedDate = DateFormat("dd-MM-yyyy").format(date!);
                setState(() {
                  dateController.text = formattedDate.toString();
                });
              },
              icon: Icon(Icons.calendar_month_outlined),
            ),
            hintText: 'Date of missing',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'please enter your last name';
              }
              return null;
            },
          ),
          TextFieldItem(
            hintText: 'State/city',
          ),
          SizedBox(
            height: 7.h,
          ),
          ContainerDropdownWidget(
            child: DropdownButton(
              isExpanded: true,
              iconEnabledColor: Colors.black,
              elevation: 0,
              style: TextStyle(color: Colors.white),
              underline: const Divider(
                thickness: 0,
                color: Colors.transparent,
              ),
              dropdownColor: theme.colorScheme.onPrimary,
              hint: const Text('Health Status'),
              items: ['Healthy', 'sick', 'special Needs']
                  .map((e) => DropdownMenuItem(
                        child: Text('$e'),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  healthStatus = val;
                });
              },
              value: healthStatus,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ContainerDropdownWidget(
            child: DropdownButton(
              isExpanded: true,
              iconEnabledColor: Colors.black,
              elevation: 0,
              style: TextStyle(color: Colors.white),
              underline: const Divider(
                thickness: 0,
                color: Colors.transparent,
              ),
              dropdownColor: theme.colorScheme.onPrimary,
              hint: const Text('Status of the missing'),
              items: ['Lost', 'Kidnapped', 'Runway', 'Other']
                  .map((e) => DropdownMenuItem(
                        child: Text('$e'),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  statusMissing = val;
                });
              },
              value: statusMissing,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ContainerDropdownWidget(
            child: DropdownButton(
              isExpanded: true,
              iconEnabledColor: Colors.black,
              elevation: 0,
              style: TextStyle(color: Colors.white),
              underline: Divider(
                thickness: 0,
                color: Colors.transparent,
              ),
              dropdownColor: theme.colorScheme.onPrimary,
              hint: const Text('Country'),
              items: ['USA', 'Egypt', 'UAE']
                  .map((e) => DropdownMenuItem(
                        child: Text('$e'),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedCountry = val;
                });
              },
              value: selectedCountry,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ReportScreenPart2.routeName);
              },
              child: Text('Countine',
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
          ),
        ])),
      ),
    );
  }

  dialog() {
    showDialog(
        builder: (context) => AlertDialog(
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
