import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/report/ResponseReportScreen.dart';
import 'package:missing_finder1/ui/widgets/ContainerDropdownWidget.dart';

import '../../../utils/TextFieldDescription.dart';
import '../../../utils/TextFieldItem.dart';

class ReportScreenPart2 extends StatefulWidget {
  static const String routeName = 'report2';

  const ReportScreenPart2({super.key});

  @override
  State<ReportScreenPart2> createState() => _ReportScreenPart2State();
}

class _ReportScreenPart2State extends State<ReportScreenPart2> {
  var gender;
  var absenceReport;
  var selectedRelation;
  var statusMissing;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
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
              TextFieldDescription(
                hintText: 'Description place of missing , clothes , etc.',
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFieldDescription(
                hintText:
                    'Birthmark , scars , moles , body marks , Ex. port wine stain',
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
              Row(
                children: [
                  Expanded(child: TextFieldItem(hintText: 'phone number')),
                  Expanded(
                    child: ContainerDropdownWidget(
                      child: DropdownButton(
                        iconEnabledColor: Colors.black,
                        elevation: 0,
                        style: TextStyle(color: Colors.white),
                        underline: Divider(
                          thickness: 0,
                        ),
                        dropdownColor: theme.colorScheme.onPrimary,
                        hint: const Text('Relation of missing'),
                        items: ['cousin', 'daughter', 'son']
                            .map((e) => DropdownMenuItem(
                                  child: Text('$e'),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedRelation = val;
                          });
                        },
                        value: selectedRelation,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
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
