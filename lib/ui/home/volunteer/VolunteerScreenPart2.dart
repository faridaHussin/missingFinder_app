import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/widgets/ContainerDropdownWidget.dart';

import '../../../utils/TextFieldItem.dart';
import '../report/ResponseReportScreen.dart';

class VolunteerScreenPart2 extends StatefulWidget {
  static const String routeName = 'volunteer2';

  const VolunteerScreenPart2({super.key});

  @override
  State<VolunteerScreenPart2> createState() => _VolunteerScreenPart2State();
}

class _VolunteerScreenPart2State extends State<VolunteerScreenPart2> {
  var gender;
  var healthStatus;
  var absenceReport;
  var selectedCountry;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
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
                height: 30.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: ContainerDropdownWidget(
                      child: DropdownButton(
                        iconEnabledColor: Colors.black,
                        elevation: 0,
                        style: TextStyle(color: Colors.white),
                        underline: const Divider(
                          thickness: 0,
                          color: Colors.transparent,
                        ),
                        dropdownColor: theme.colorScheme.onPrimary,
                        hint: const Text('Gender'),
                        items: ['Male', 'Female']
                            .map((e) => DropdownMenuItem(
                                  child: Text('$e'),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            gender = val;
                          });
                        },
                        value: gender,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerDropdownWidget(
                      child: DropdownButton(
                        iconEnabledColor: Colors.black,
                        elevation: 0,
                        style: TextStyle(color: Colors.white),
                        underline: const Divider(
                          thickness: 0,
                          color: Colors.transparent,
                        ),
                        dropdownColor: theme.colorScheme.onPrimary,
                        hint: const Text('Absence Report'),
                        items: ['Yes', 'No', 'No clue']
                            .map((e) => DropdownMenuItem(
                                  child: Text('$e'),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            absenceReport = val;
                          });
                        },
                        value: absenceReport,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
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
                height: 15.h,
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
                height: 15.h,
              ),
              Text('Drop your info',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15.h,
              ),
              TextFieldItem(hintText: 'phone number'),
              SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, ResponseReportScreen.routeName);
                  },
                  child: Text('Submit',
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
            ],
          ),
        ),
      ),
    );
  }
}
