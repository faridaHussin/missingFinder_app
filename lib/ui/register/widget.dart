import 'package:flutter/material.dart';

class Widget extends StatefulWidget {
  const Widget({super.key});

  @override
  State<Widget> createState() => _WidgetState();
}

class _WidgetState extends State<Widget> {
  late String gender;

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RadioListTile(
              title: Text('Male'),
              value: 'Male',
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val!;
                });
              })
        ],
      ),
    );
  }
}
