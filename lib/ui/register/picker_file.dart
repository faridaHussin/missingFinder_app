import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickerFilePage extends StatefulWidget {
  static const String routeName = 'picker_file';

  const PickerFilePage({super.key});

  @override
  State<PickerFilePage> createState() => _PickerFilePageState();
}

class _PickerFilePageState extends State<PickerFilePage> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowedExtensions: ['png', 'pdf'],
        allowMultiple: false,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        print('File name$_fileName');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: ElevatedButton(
              onPressed: () {
                pickFile();
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
                backgroundColor: Color(0xFFE8D6D6).withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: theme.primaryColor),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          if (pickedfile != null)
            SizedBox(
              height: 250.h,
              width: 300.w,
              child: Image.file(fileToDisplay!),
            ),
        ],
      ),
    );
  }
}
